import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:base_bloc_3/base/bloc/bloc_status.dart';
import 'package:base_bloc_3/common/app_theme/app_colors.dart';
import 'package:base_bloc_3/common/widgets/base_scaffold.dart';
import 'package:base_bloc_3/features/weather/domain/entity/city_entity.dart';
import 'package:base_bloc_3/features/weather/presentation/widgets/area_component.dart';
import 'package:base_bloc_3/features/weather/presentation/widgets/search_widget.dart';
import 'package:base_bloc_3/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../base/base_widget.dart';
import '../../../../base/bloc/index.dart';
import '../../../../common/index.dart';
import '../../../../gen/assets.gen.dart';
import '../bloc/weather_bloc.dart';
import '../widgets/search_area.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState
    extends BaseState<WeatherPage, WeatherEvent, WeatherState, WeatherBloc> {
  late OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    bloc.add(WeatherEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColors.primaryColor2,
      appBar: BaseAppBar(
        leadingColor: AppColors.white,
        backgroundColor: AppColors.primaryColor2,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Assets.svg.actionsWeather.svg(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weather',
              style: TextStyle(
                fontSize: 44.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.h),
            Builder(builder: (_) {
              return SearchArea(bloc: bloc
                  // showOverlay: () => showOverlay(context),
                  // hideOverlay: () => hideOverlay(),
                  );
            }),
            SizedBox(height: 8.h),
            blocBuilder(
                (c, p1) => p1.status == BaseStateStatus.loading
                    ? Center(
                        child: Platform.isIOS
                            ? const CupertinoActivityIndicator()
                            : const CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: ListView.separated(
                          itemCount: 1,
                          itemBuilder: (context, index) =>
                              AreaComponent(area: p1.area),
                          separatorBuilder: (context, index) => Divider(
                            height: 10.h,
                          ),
                        ),
                      ),
                buildWhen: (p0, p1) => p0.area != p1.area),
          ],
        ),
      ),
    );
  }
}

class _ListArea extends StatefulWidget {
  _ListArea({super.key, this.bloc});
  WeatherBloc? bloc;

  @override
  State<_ListArea> createState() => __ListAreaState();
}

class __ListAreaState
    extends BaseShareState<_ListArea, WeatherEvent, WeatherState, WeatherBloc> {
  Widget renderUI(BuildContext context) {
    return bloc.state.status == BaseStateStatus.loading
        ? Center(
            child: Platform.isIOS
                ? const CupertinoActivityIndicator()
                : const CircularProgressIndicator(),
          )
        : ListView.separated(
            itemCount: 1,
            itemBuilder: (context, index) =>
                AreaComponent(area: bloc.state.area),
            separatorBuilder: (context, index) => Divider(
              height: 10.h,
            ),
          );
  }
}

class ListSearchArea extends StatelessWidget {
  ListSearchArea({super.key, this.fn});
  Function()? fn;

  @override
  Widget build(BuildContext context) {
    final bloc = context.select((WeatherBloc bloc) => bloc);
    final state = context.select((WeatherBloc bloc) => bloc.state);

    switch (state.status) {
      case BaseStateStatus.loading:
        return SizedBox(
          height: 10,
          child: Center(
            child: Platform.isIOS
                ? const CupertinoActivityIndicator()
                : const CircularProgressIndicator(),
          ),
        );
      case BaseStateStatus.failed:
        return const SizedBox(
          height: 10,
          child: Text('Not found'),
        );
      default:
        return SizedBox(
          // padding: const EdgeInsets.all(8),
          height: 100,
          // color: Colors.red,
          child: state.listCity != null
              ? ListView.separated(
                  padding: const EdgeInsets.all(0),
                  itemCount: state.listCity!.length,
                  itemBuilder: (context, int) => GestureDetector(
                    child: Text(
                      '${state.listCity?[int].englishName} - ${state.listCity?[int].country?.englishName} - ${state.listCity?[int].id}',
                      style: AppStyles.t16p
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    onTap: () {
                      // print('${bloc.l[int]}');
                      bloc.add(
                        WeatherEvent.chooseCity(
                            '${state.listCity?[int].englishName}',
                            state.listCity![int]),
                      );
                      fn?.call();
                    },
                  ),
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                )
              : const Center(
                  child: Text('Empty'),
                ),
        );
    }
  }
}
