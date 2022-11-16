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
import 'package:flutter/material.dart';
import '../../../../base/base_widget.dart';
import '../bloc/homescreen_bloc.dart';
import '../widgets/uv_index_widget.dart';
import '../widgets/wind_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.locationKey});
  final String? locationKey;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeScreenEvent,
    HomeScreenState, HomeScreenBloc> {
  final _debounce = Debounce(milliseconds: 500);

  @override
  void initState() {
    print(widget.locationKey);
    super.initState();
    bloc.add(HomeScreenEvent.getData(widget.locationKey ?? '353412'));
    bloc.add(
        HomeScreenEvent.getDataForecastTime(widget.locationKey ?? '353412'));
    bloc.add(
        HomeScreenEvent.getDataForecastDay(widget.locationKey ?? '353412'));
    bloc.add(HomeScreenEvent.getDataForecastDateTime(
        forecastDateTimes: bloc.state.forecastDateTimes,
        locationKey: widget.locationKey ?? '353412'));
    // bloc.pagingController.addPageRequestListener((pageKey) => bloc.add(
    //       HomeScreenEvent.getDataForecastDateTime(
    //         forecastDateTimes: bloc.state.forecastDateTimes,
    //       ),
    //       // ),
    //     ));
  }

  @override
  void dispose() {
    _debounce.dispose();
    super.dispose();
  }

  @override
  Widget renderUI(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
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
                height: 225,
                width: 370,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white54,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: blocBuilder((c, p1) {
                    // ignore: avoid_print
                    print(p1.status);
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
                height: 345,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white54,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  child: blocBuilder((c, p1) {
                    // ignore: avoid_print
                    print(p1.status);
                    // return Container();
                    return p1.status == BaseStateStatus.loading
                        ? const Center(child: CircularProgressIndicator())
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
                child: const TemperatureWidget(),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 29,
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
                    child: const UVIndexWidget(),
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
                    child: const SunsetWidget(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 29,
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
                    child: const WindWidget(),
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
                    child: const RainfallWidget(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 29,
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
                    child: const FeelsLikeWidget(),
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
                    child: const HumidityWidget(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 29,
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
                    child: const VisibilityWidget(),
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
                    child: const PressureWidget(),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
