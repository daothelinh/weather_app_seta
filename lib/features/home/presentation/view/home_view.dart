import 'dart:async';

import 'package:base_bloc_3/base/bloc/bloc_status.dart';
import 'package:base_bloc_3/common/event_bus/add_area_event.dart';
import 'package:base_bloc_3/common/event_bus/change_index_home_event.dart';
import 'package:base_bloc_3/features/home/presentation/bloc/home_bloc.dart';
import 'package:base_bloc_3/features/homescreen/presentation/pages/home_screen.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/base_widget.dart';
import '../../../../di/di_setup.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState
    extends BaseState<HomeView, HomeEvent, HomeState, HomeBloc> {
  late StreamSubscription deleteIndexArea;
  late StreamSubscription addArea;
  // final PageController? controller = PageController(initialPage: 1);
  @override
  void initState() {
    super.initState();
    bloc.add(const HomeEvent.init());

    deleteIndexArea =
        getIt<EventBus>().on<DeleteIndexArea>().listen((event) async {
      bloc.add(HomeEvent.deteleIndexArea(event.index));
    });
    addArea = getIt<EventBus>().on<AddAreaEvent>().listen((event) {
      bloc.add(const HomeEvent.addArea());
    });
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
            print(p1.listLocationKey?[index]);
            return HomeScreen(
              locationKey: p1.listLocationKey?[index],
            );
          },
        ),
        buildWhen: (p1, p2) => p1.listLocationKey != p2.listLocationKey,
      ),
    );
  }
}
