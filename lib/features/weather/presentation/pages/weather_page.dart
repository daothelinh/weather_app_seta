import 'package:base_bloc_3/base/bloc/bloc_status.dart';
import 'package:base_bloc_3/common/app_theme/app_colors.dart';
import 'package:base_bloc_3/common/widgets/base_scaffold.dart';
import 'package:base_bloc_3/features/weather/presentation/widgets/area_component.dart';
import 'package:base_bloc_3/features/weather/presentation/widgets/search_widget.dart';
import 'package:easy_localization/easy_localization.dart';
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

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends BaseShareState<WeatherPage, WeatherEvent,
    WeatherState, WeatherBloc> {
  late OverlayEntry? entry;
  // late TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    // bloc.controller = TextEditingController();
    bloc.add(WeatherEvent.init());
  }

  void showOverlay(BuildContext context) {
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          left: offset.dx,
          top: offset.dy + size.height,
          width: size.width,
          // child: BuildOverlay(fn: hideOverlay, list: bloc.l),
          child: BuildOverlay(fn: hideOverlay, bloc: bloc),
        );
      },
    );
    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColors.primaryColor2,
      appBar: AppBar(
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
            Builder(builder: (context) {
              return _SearchArea(showOverlay: () => showOverlay(context));
            }),
            SizedBox(height: 8.h),
            Expanded(
              child: ListView.separated(
                itemCount: 2,
                itemBuilder: (context, index) => AreaComponent(
                  index: index,
                ),
                separatorBuilder: (context, index) => Divider(
                  height: 10.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchArea extends StatelessWidget {
  _SearchArea({super.key, this.showOverlay});
  Function()? showOverlay;

  @override
  Widget build(BuildContext context) {
    final bloc = context.select((WeatherBloc bloc) => bloc);
    final controller = context.select((WeatherBloc bloc) => bloc.controller);
    // final state = context.select((WeatherBloc bloc) => bloc.state);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchWidget(
        controller: controller,
        hintText: 'Search for a city or airport'.tr(),
        onChange: (text) => bloc.add(WeatherEvent.searching(text)),
        onTap: () {
          showOverlay?.call();
          bloc.add(WeatherEvent.showOverlay());
        },
      ),
    );
  }
}

class BuildOverlay extends StatefulWidget {
  final WeatherBloc bloc;
  BuildOverlay({super.key, this.fn, required this.bloc});
  Function()? fn;

  @override
  State<BuildOverlay> createState() => _BuildOverlayState();
}

class _BuildOverlayState extends BaseShareState<BuildOverlay, WeatherEvent,
    WeatherState, WeatherBloc> {
  @override
  provideBloc(context) => widget.bloc;

  @override
  Widget renderUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 8,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: widget.fn,
                icon: const Icon(Icons.close),
              ),
            ),
            // blocBuilder((c, p1) => Text('${p1.listSearch?.length}')),
            ListSearchArea(fn: widget.fn),
          ],
        ),
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
    return Container(
      padding: const EdgeInsets.all(8),
      height: 100,
      // color: Colors.red,
      child: ListView.separated(
        padding: const EdgeInsets.all(0),
        itemCount: state.listSearch!.length,
        itemBuilder: (context, int) => GestureDetector(
          child: Text(
            '${state.listSearch?[int]}',
            style: AppStyles.t16p.copyWith(color: AppColors.primaryColor),
          ),
          onTap: () {
            // print('${bloc.l[int]}');
            bloc.add(
              WeatherEvent.chooseCity('${state.listSearch?[int]}'),
            );
            fn?.call();
          },
        ),
        separatorBuilder: (context, index) => const Divider(height: 1),
      ),
    );
  }
}
