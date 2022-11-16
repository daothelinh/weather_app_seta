import 'package:base_bloc_3/common/event_bus/change_index_home_event.dart';
import 'package:base_bloc_3/features/home/presentation/bloc/home_bloc.dart';
import 'package:base_bloc_3/features/homescreen/presentation/pages/home_screen.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

import '../../../../base/base_widget.dart';
import '../../../../di/di_setup.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState
    extends BaseState<HomeView, HomeEvent, HomeState, HomeBloc> {
  // final PageController? controller = PageController(initialPage: 1);
  @override
  void initState() {
    super.initState();
    bloc.add(const HomeEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background/background.jpg"),
              fit: BoxFit.cover)),
      child: blocBuilder(
        (c, p1) => PageView.builder(
          onPageChanged: (index) {
            getIt<EventBus>().fire(ChangeIndexHomeEvent(index));
          },
          itemCount: p1.listLocationKey?.length ?? 1,
          itemBuilder: (context, index) {
            return HomeScreen(
              locationKey: p1.listLocationKey?[index],
            );
          },
        ),
      ),
    );
  }
}
