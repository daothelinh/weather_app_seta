import 'dart:ui';

import 'package:base_bloc_3/base/bloc/bloc_status.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/forecast_dayWG.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/forecast_timeWG.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/temperatureWG.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/weather_bar.dart';
import 'package:flutter/material.dart';

import '../../../../base/base_widget.dart';
import '../bloc/homescreen_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeScreenEvent,
    HomeScreenState, HomeScreenBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(HomeScreenEvent.getData());
  }

  @override
  Widget renderUI(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background/background.jpg"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
            child: Center(
                child: Column(
          children: <Widget>[
            blocBuilder(
              (c, p1) => p1.status == BaseStateStatus.loading
                  ? const CircularProgressIndicator()
                  : WeatherBarWG(
                      temperature: p1.weatherbars?[0],
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 370,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white54,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const ForeCastTimeWG(),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 480,
              width: 370,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white54,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const ForeCastDayWG(),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: 370,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white54,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const TemperatureWG(),
            ),
            Row(
              children: <Widget>[Column()],
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ))),
      ),
    );
  }
}
