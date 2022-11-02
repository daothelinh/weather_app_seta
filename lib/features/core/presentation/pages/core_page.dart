import 'package:base_bloc_3/features/core/presentation/bloc/core_bloc.dart';
import 'package:base_bloc_3/features/start/presentation/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../base/base_widget.dart';
import '../../../../common/index.dart';
import '../../../../gen/assets.gen.dart';
import '../../../example/presentation/pages/example_page.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../weather/presentation/pages/weather_page.dart';

class CorePage extends StatefulWidget {
  const CorePage({Key? key}) : super(key: key);

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState
    extends BaseState<CorePage, CoreEvent, CoreState, CoreBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const CoreEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return const BaseScaffold(
      body: _Screens(),
      bottomNavigation: _XBottomNavigationBar(),
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
        StartPage(),
        HomePage(),
        WeatherPage(),
      ],
    );
  }
}

class _XBottomNavigationBar extends StatelessWidget {
  const _XBottomNavigationBar();

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
          icon: Assets.svg.firstIcon.svg(),
          activeIcon: Assets.svg.firstIcon.svg(),
          label: '',
          showDot: true,
        ),
        _buildBottomNavItem(
          icon: const Icon(Icons.add),
          activeIcon: const Icon(Icons.add),
          showDot: true,
        ),
        _buildBottomNavItem(
          icon: Assets.svg.list.svg(),
          activeIcon: Assets.svg.list.svg(),
          showDot: true,
        ),
      ],
      currentIndex: index,
      onTap: (i) => bloc.add(CoreEvent.changeIndex(i)),
    );
  }
}

BottomNavigationBarItem _buildBottomNavItem(
    {String? label,
    required Widget icon,
    required Widget activeIcon,
    bool? showDot}) {
  return BottomNavigationBarItem(
    label: label ?? '',
    icon: SizedBox(
      height: 30.w,
      width: 30.w, //todo: constants
      child: Stack(
        children: [
          icon,
          Positioned(
            right: 2,
            top: 1,
            child: Visibility(
              visible: false,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
        ],
      ),
    ),
    activeIcon: Stack(
      children: [
        activeIcon,
        Positioned(
          right: 2,
          top: 1,
          child: Visibility(
            visible: showDot ?? false,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        )
      ],
    ),
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
