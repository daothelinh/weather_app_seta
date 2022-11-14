import 'package:base_bloc_3/common/event_bus/change_index_home_event.dart';
import 'package:base_bloc_3/features/home/presentation/bloc/home_bloc.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../base/base_widget.dart';
import '../../../../di/di_setup.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState
    extends BaseState<HomeView, HomeEvent, HomeState, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const HomeEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return Container(
      // height: 200,
      color: Colors.red,
      child: blocBuilder(
        (c, p1) => PageView.builder(
          onPageChanged: (index) {
            getIt<EventBus>().fire(ChangeIndexHomeEvent(index));
          },
          itemCount: p1.listLocationKey?.length ?? 1,
          itemBuilder: (context, index) {
            return Container(
              child: Text(
                'page....',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            );
          },
        ),
      ),
    );
  }
}
