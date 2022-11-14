import 'package:base_bloc_3/base/bloc/bloc_status.dart';
import 'package:base_bloc_3/common/widgets/textfields/debounce.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/feels-like_widget.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/forecast_day_widget.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/forecast_time_widget.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/humidity_widget.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/pressure_widget.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/rainfall_widget.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/sunset_widget.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/temperature_widget.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/visibility_widget.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/weather_bar_widget.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

import '../../../../base/base_widget.dart';
import '../../../../common/event_bus/change_index_home_event.dart';
import '../../../../di/di_setup.dart';
import '../bloc/homescreen_bloc.dart';
import '../widgets/uv_index_widget.dart';
import '../widgets/wind_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeScreenEvent,
    HomeScreenState, HomeScreenBloc> {
  final _debounce = Debounce(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    bloc.add(const HomeScreenEvent.getData());
    bloc.add(const HomeScreenEvent.getDataForecastTime());
    bloc.add(const HomeScreenEvent.getDataForecastDay());
    bloc.add(HomeScreenEvent.getDataForecastDateTime(
        forecastDateTimes: bloc.state.forecastDateTimes));
    // bloc.pagingController.addPageRequestListener((pageKey) => bloc.add(
    //       HomeScreenEvent.getDataForecastDateTime(
    //         forecastDateTimes: bloc.state.forecastDateTimes,
    //       ),
    //       // ),
    //     ));
  }

  void dispose() {
    _debounce.dispose();
    super.dispose();
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
                      child: blocBuilder((c, p1) {
                        return p1.status == BaseStateStatus.loading
                            ? const CircularProgressIndicator()
                            : WeatherBarWidget(
                                temperature: p1.weatherbars?[0],
                                forecastTimeEntity: p1.forecastTime,
                              );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 220,
                      width: 370,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white54,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: blocBuilder((c, p1) {
                          print(p1.status);
                          // return Container();
                          return p1.status == BaseStateStatus.loading
                              ? const CircularProgressIndicator()
                              : ForecastTimeWidget(
                                  forecastTimeEntity: p1.forecastTime,
                                  // forecastDateTimeEntity:
                                  //     p1.forecastDateTimes[0],
                                );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 380,
                      width: 390,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white54,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: blocBuilder((c, p1) {
                          print(p1.status);
                          // return Container();
                          return p1.status == BaseStateStatus.loading
                              ? const CircularProgressIndicator()
                              : ForecastDayWidget(
                                  forecastDayEntity: p1.forecastDay,
                                );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 300,
                      width: 370,
                      decoration: BoxDecoration(
                        // backgroundBlendMode: BlendMode.darken,
                        border: Border.all(
                          color: Colors.white54,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TemperatureWidget(),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white54,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: UVIndexWidget(),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white54,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: SunsetWidget(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white54,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: WindWidget(),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white54,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: RainfallWidget(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white54,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: FeelsLikeWidget(),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white54,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: HumidityWidget(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white54,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: VisibilityWidget(),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white54,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: PressureWidget(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
