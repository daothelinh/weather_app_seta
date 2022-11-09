import 'package:auto_route/auto_route.dart';
import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/common/app_theme/app_styles.dart';
import 'package:base_bloc_3/common/widgets/paging_list_view.dart';
import 'package:base_bloc_3/common/widgets/textfields/app_textfield.dart';
import 'package:base_bloc_3/features/weather/data/model/area_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../base/base_widget.dart';
import '../bloc/weather_bloc.dart';

class WeatherPageDialog extends StatefulWidget {
  const WeatherPageDialog({super.key, required this.bloc});
  final WeatherBloc bloc;

  @override
  State<WeatherPageDialog> createState() => _WeatherPageDialogState();
}

class _WeatherPageDialogState extends BaseShareState<WeatherPageDialog,
    WeatherEvent, WeatherState, WeatherBloc> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  provideBloc(context) => widget.bloc;
  @override
  Widget renderUI(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Material(
              color: Colors.black.withOpacity(0.5),
              child: AppTextField(
                controller: bloc.controller,
                textStyle:
                    AppStyles.t16p.copyWith(color: Colors.white, fontSize: 20),
                hintText: 'title_search'.tr(),
                // backgroundColor: Colors.white.withOpacity(0.5),
                autofocus: true,
                onChanged: (text) => bloc.add(WeatherEvent.getSearchText(text)),
              ),
            ),
            const Expanded(
              child: _ListArea(),
            ),
            GestureDetector(
              onTap: () => context.router.pop(),
              child: Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.r)),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Center(
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 30.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListArea extends StatelessWidget {
  const _ListArea({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.select((WeatherBloc bloc) => bloc);
    final state = context.select((WeatherBloc bloc) => bloc.state);
    final status = context.select((WeatherBloc bloc) => bloc.state.status);
    switch (status) {
      case BaseStateStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case BaseStateStatus.success:
        return Text('done'
            // ListView.separated(
            //     itemBuilder: (context, index) => Text(
            //         '${state.area?[index].englishName}',
            //         style: AppStyles.t16p),
            //     separatorBuilder: (context, index) => const Divider(height: 1),
            //     itemCount: state.area!.length
            // return CustomListViewSeparated<AreaModel>(
            //   controller: bloc.pageController,
            //   builder: (c, m, i) => Text('${m.englishName}'),
            //   separatorBuilder: (c, i) => const Divider(height: 1),
            );
      case BaseStateStatus.init:
        return ListView.builder(
          itemBuilder: (c, i) => Text('text'),
          itemCount: 10,
        );
      default:
        return Container();
    }
  }
}
