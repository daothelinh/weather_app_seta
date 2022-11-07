import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:base_bloc_3/common/event_bus/change_index_home_event.dart';
import 'package:base_bloc_3/features/core/presentation/bloc/core_bloc.dart';
import 'package:base_bloc_3/routes/app_pages.dart';
import 'package:base_bloc_3/routes/app_routes.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../base/base_widget.dart';
import '../../../../common/index.dart';
import '../../../../di/di_setup.dart';
import '../../../../gen/assets.gen.dart';
import '../../../example/presentation/pages/example_page.dart';
import '../../../home/presentation/view/home_view.dart';

class CorePage extends StatefulWidget {
  const CorePage({Key? key}) : super(key: key);

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState
    extends BaseState<CorePage, CoreEvent, CoreState, CoreBloc> {
  late StreamSubscription changeIndexHome;
  @override
  void initState() {
    super.initState();
    bloc.add(const CoreEvent.init());
    changeIndexHome =
        getIt<EventBus>().on<ChangeIndexHomeEvent>().listen((event) async {
      bloc.add(CoreEvent.changeIndexHome(event.index));
    });
  }

  @override
  void dispose() {
    super.dispose();
    changeIndexHome.cancel();
  }

  @override
  Widget renderUI(BuildContext context) {
    return Scaffold(
      body: const _Screens(),
      bottomNavigationBar: _XBottomNavigationBar(),
    );
  }
}

class _Screens extends StatelessWidget {
  const _Screens();

  @override
  Widget build(BuildContext context) {
    final index = context.select((CoreBloc bloc) => bloc.state.index);

    return IndexedStack(
      index: index,
      children: const [
        DummyScreen(),
        // DummyScreen(),
        HomeView(),
        SizedBox.shrink(),
      ],
    );
  }
}

class _XBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.select((CoreBloc bloc) => bloc);
    final index = context.select((CoreBloc bloc) => bloc.state.index);
    return BottomNavigationBar(
        iconSize: 30.sp,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.greenAccent,
        fixedColor: Colors.purple,
        selectedFontSize: 12,
        items: [
          _buildBottomNavItem(
            icon:
                Assets.svg.firstIcon.svg(color: Colors.white.withOpacity(0.3)),
            activeIcon: Assets.svg.firstIcon.svg(color: Colors.white),
            size: 20.sp,
          ),
          _buildBottomNavItem(
            icon: Icon(
              Icons.home,
              color: Colors.white.withOpacity(0.3),
              size: 25.sp,
            ),
            activeIcon: _ActiveIcon(),
            size: 20.sp,
          ),
          _buildBottomNavItem(
            icon: Assets.svg.list.svg(color: Colors.white.withOpacity(0.3)),
            activeIcon: Assets.svg.list.svg(color: Colors.white),
            size: 20.sp,
          ),
        ],
        currentIndex: index,
        onTap: (i) {
          if (i == 2) {
            // context.router.pushNamed(AppRoutes.weather);
          } else {
            bloc.add(CoreEvent.changeIndex(i));
          }
        });
  }
}

class _ActiveIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.select((CoreBloc bloc) => bloc);
    final indexHome = context.select((CoreBloc bloc) => bloc.state.indexHome);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.from(bloc.listInt
          .map(
            (e) => e == indexHome
                ? const RedDot(
                    borderColor: Colors.white,
                  )
                : const RedDot(),
          )
          .toList()),
    );
  }
}

BottomNavigationBarItem _buildBottomNavItem({
  String? label,
  required Widget icon,
  required Widget activeIcon,
  required double size,
  // bool? showDot,
}) {
  return BottomNavigationBarItem(
    label: label ?? '',
    icon: SizedBox(
      height: size.h,
      width: size.w, //todo: constants
      child: icon,
    ),
    activeIcon: activeIcon,
  );
}

class DummyScreen extends StatelessWidget {
  const DummyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: ListView.builder(
        itemBuilder: (c, i) => ListTile(
          title: Text("index: $i"),
        ),
        itemCount: 1000,
      ),
    );
  }
}

class RedDot extends StatelessWidget {
  const RedDot({super.key, this.color, this.borderColor});
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.sp),
      width: 10.w,
      height: 10.h,
      decoration: BoxDecoration(
        border: Border.all(
            width: 2, color: borderColor ?? Colors.white.withOpacity(0.3)),
        color: color ?? Colors.transparent,
        shape: BoxShape.circle,
      ),
    );
  }
}
