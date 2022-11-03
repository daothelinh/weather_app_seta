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
  // late TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    // bloc.controller = TextEditingController();
    bloc.add(WeatherEvent.init());
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   entry?.remove();
  //   print('dispose');
  //   // hideOverlay();
  // }

  // void showOverlay(BuildContext context) {
  //   final overlay = Overlay.of(context)!;
  //   final renderBox = context.findRenderObject() as RenderBox;
  //   final size = renderBox.size;
  //   final offset = renderBox.localToGlobal(Offset.zero);

  //   entry = OverlayEntry(
  //     builder: (BuildContext context) {
  //       return Positioned(
  //         left: offset.dx,
  //         top: offset.dy + size.height,
  //         width: size.width,
  //         // child: BuildOverlay(fn: hideOverlay, list: bloc.l),
  //         child: _BuildOverlay(fn: hideOverlay, bloc: bloc),
  //       );
  //     },
  //   );
  //   overlay.insert(entry!);
  // }

  // void hideOverlay() {
  //   entry?.remove();
  //   entry = null;
  // }

  @override
  Widget renderUI(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          // entry!.dispose();
        },
        child: Scaffold(
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
                ElevatedButton(
                  onPressed: () => context.router.pushNamed(AppRoutes.home),
                  child: Text('go to home page'),
                ),
                // blocBuilder(
                //     (c, p1) => p1.status == BaseStateStatus.loading
                //         ? const CircularProgressIndicator()
                //         : Container(),
                //     buildWhen: (p1, p2) => p1.listCity != p2.listCity),
              ],
            ),
          ),
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

// class _SearchArea extends StatefulWidget {
//   _SearchArea(
//       {super.key, this.showOverlay, this.hideOverlay, this.show = false});
//   Function()? showOverlay;
//   Function()? hideOverlay;
//   bool? show;

//   @override
//   State<_SearchArea> createState() => _SearchAreaState();
// }

// class _SearchAreaState
//     extends BaseShareState<_SearchArea, WeatherEvent, WeatherState, WeatherBloc> {
//   late OverlayEntry? entry;

//   void showOverlay(BuildContext context) {
//     final overlay = Overlay.of(context)!;
//     final renderBox = context.findRenderObject() as RenderBox;
//     final size = renderBox.size;
//     final offset = renderBox.localToGlobal(Offset.zero);

//     entry = OverlayEntry(
//       builder: (BuildContext context) {
//         return Positioned(
//           left: offset.dx,
//           top: offset.dy + size.height,
//           width: size.width,
//           // child: BuildOverlay(fn: hideOverlay, list: bloc.l),
//           child: _BuildOverlay(fn: hideOverlay, bloc: bloc),
//         );
//       },
//     );
//     overlay.insert(entry!);
//   }

//   void hideOverlay() {
//     entry?.remove();
//     entry = null;
//   }

//   @override
//   Widget renderUI(BuildContext context) {
//     final bloc = context.select((WeatherBloc bloc) => bloc);
//     final controller = context.select((WeatherBloc bloc) => bloc.controller);
//     // final state = context.select((WeatherBloc bloc) => bloc.state);
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SearchWidget(
//         controller: controller,
//         hintText: 'Search for a city or airport'.tr(),
//         // onChange: (text) {
//         //   if (controller.text.isEmpty) {
//         //     widget.hideOverlay?.call();
//         //   } else {
//         //     widget.showOverlay?.call();
//         //     bloc.add(WeatherEvent.searching(text));
//         //   }
//         // },
//         onTap: () {
//           // print('show');

//           // widget.show = !widget.show!;
//           // // bloc.isShowOverlay = !bloc.isShowOverlay;
//           // if (widget.show == true && controller.text.isEmpty) {
//           //   bloc.add(const WeatherEvent.showOverlay());
//           //   widget.showOverlay?.call();
//           // } else {
//           //   widget.hideOverlay?.call();
//           // }
//           showOverlay(context);
//           //   // show = !show!;
//         },
//       ),
//     );
//   }
// }

// class _BuildOverlay extends StatefulWidget {
//   _BuildOverlay({super.key, this.fn, required this.bloc});
//   final WeatherBloc bloc;
//   final Function()? fn;

//   @override
//   State<_BuildOverlay> createState() => _BuildOverlayState();
// }

// class _BuildOverlayState extends BaseShareState<_BuildOverlay, WeatherEvent,
//     WeatherState, WeatherBloc> {
//   @override
//   provideBloc(context) => widget.bloc;

//   @override
//   Widget renderUI(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: Material(
//         elevation: 4,
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.topRight,
//               child: ElevatedButton(
//                 onPressed: widget.fn,
//                 child: const Icon(Icons.close),
//               ),
//             ),
//             // blocBuilder((c, p1) => Text('${p1.listSearch?.length}')),
//             ListSearchArea(fn: widget.fn),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
      // case BaseStateStatus.success:
      //   return Container(
      //     padding: const EdgeInsets.all(8),
      //     height: 100,
      //     // color: Colors.red,
      //     child: ListView.separated(
      //       padding: const EdgeInsets.all(0),
      //       itemCount: state.listCity!.length,
      //       itemBuilder: (context, int) => GestureDetector(
      //         child: Text(
      //           '${state.listCity?[int].englishName} - ${state.listCity?[int].country?.englishName} - ${state.listCity?[int].id}',
      //           style: AppStyles.t16p.copyWith(color: AppColors.primaryColor),
      //         ),
      //         onTap: () {
      //           // print('${bloc.l[int]}');
      //           bloc.add(
      //             WeatherEvent.chooseCity(
      //               '${state.listCity![int].englishName}',
      //               state.listCity![int],
      //             ),
      //           );
      //           fn?.call();
      //           // bloc.add(WeatherEvent.getArea('${state.listCity![int].id}'));
      //         },
      //       ),
      //       separatorBuilder: (context, index) => const Divider(height: 1),
      //     ),
      //   );
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
