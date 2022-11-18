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
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  // final _debounce = Debounce(milliseconds: 500);

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
    // _debounce.dispose();
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
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 225.h,
                width: 370.w,
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
                          );
                  }),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                height: 345.h,
                width: 400.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white54,
                  ),
                  borderRadius: BorderRadius.circular(20.0.r),
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
              SizedBox(
                height: 40.h,
              ),
              Container(
                height: 310.h,
                width: 370.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white54,
                  ),
                  borderRadius: BorderRadius.circular(20.0.r),
                ),
                child: const TemperatureWidget(),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15.0.w),
                    child: Container(
                      height: 160.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white54,
                        ),
                        borderRadius: BorderRadius.circular(20.0.r),
                      ),
                      child: const UVIndexWidget(),
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Container(
                    height: 160.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white54,
                      ),
                      borderRadius: BorderRadius.circular(20.0.r),
                    ),
                    child: const SunsetWidget(),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15.0.w),
                    child: Container(
                      height: 160.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white54,
                        ),
                        borderRadius: BorderRadius.circular(20.0.r),
                      ),
                      child: const WindWidget(),
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Container(
                    height: 160.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white54,
                      ),
                      borderRadius: BorderRadius.circular(20.0.r),
                    ),
                    child: const RainfallWidget(),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15.0.w),
                    child: Container(
                      height: 160.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white54,
                        ),
                        borderRadius: BorderRadius.circular(20.0.r),
                      ),
                      child: const FeelsLikeWidget(),
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Container(
                    height: 160.h,
                    width: 160.w,
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
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15.0.w),
                    child: Container(
                      height: 160.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white54,
                        ),
                        borderRadius: BorderRadius.circular(20.0.r),
                      ),
                      child: const VisibilityWidget(),
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Container(
                    height: 160.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white54,
                      ),
                      borderRadius: BorderRadius.circular(20.0.r),
                    ),
                    child: const PressureWidget(),
                  ),
                ],
              ),
              SizedBox(
                height: 80.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
