import 'package:base_bloc_3/base/bloc/bloc_status.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/forecast_day_widget.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/forecast_time_widget.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/temperature_widget.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/weather_bar_widget.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

import '../../../../base/base_widget.dart';
import '../../../../common/event_bus/change_index_home_event.dart';
import '../../../../di/di_setup.dart';
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
    bloc.add(const HomeScreenEvent.getData());
    bloc.add(const HomeScreenEvent.getDataForecastTime());
  }

  @override
  Widget renderUI(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            onPageChanged: (index) {
              getIt<EventBus>().fire(ChangeIndexHomeEvent(index));
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background/background.jpg"),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                    child: Center(
                        child: Column(
                  children: <Widget>[
                    Center(
                      child: blocBuilder(
                        (c, p1) => p1.status == BaseStateStatus.loading
                            ? const CircularProgressIndicator()
                            : WeatherBarWidget(
                                temperature: p1.weatherbars?[0],
                                forecastTimeEntity: p1.forecastTime,
                              ),
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
                      child: Center(
                        child: blocBuilder(
                          (c, p1) => p1.status == BaseStateStatus.loading
                              ? const CircularProgressIndicator()
                              : ForecastTimeWidget(
                                  forecastTimeEntity: p1.forecastTime,
                                ),
                        ),
                      ),
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
                      child: const ForecastDayWidget(),
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
                      child: const TemperatureWidget(),
                    ),
                    Row(
                      children: <Widget>[Column()],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ))),
              );
            }));
  }
}
