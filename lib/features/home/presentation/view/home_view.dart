// import 'package:base_bloc_3/common/event_bus/change_index_home_event.dart';
// import 'package:base_bloc_3/features/home/presentation/bloc/home_bloc.dart';
// import 'package:base_bloc_3/features/homescreen/presentation/pages/home_screen.dart';
// import 'package:event_bus/event_bus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../../../base/base_widget.dart';
// import '../../../../di/di_setup.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState
//     extends BaseState<HomeView, HomeEvent, HomeState, HomeBloc> {
//   @override
//   Widget renderUI(BuildContext context) {
//     return Container(
//       child: PageView.builder(
//         onPageChanged: (index) {
//           getIt<EventBus>().fire(ChangeIndexHomeEvent(index));
//         },
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           // return Container(
//           //   child: Text(
//           //     'page....',
//           //     style: TextStyle(color: Colors.white, fontSize: 40),
//           //   ),
//           // );
//           return const HomeScreen();
//         },
//       ),
//     );
//   }
// }
