import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_time/forecast_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/weatherbar/weather_bar_entity.dart';
import 'package:base_bloc_3/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherBarWidget extends StatelessWidget {
  const WeatherBarWidget({
    super.key,
    this.temperature,
    this.forecastTimeEntity,
  });
  final WeatherBarEntity? temperature;
  final ForecastTimeEntity? forecastTimeEntity;

  convertFtoC(double f) {
    return ((f - 32) * 5 / 9).floor();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 78.h),
          child: Text(
            "Hanoi",
            style: TextStyle(fontSize: 37.sp, color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.w, top: 10.h),
          child: Text(
            "${(temperature?.temperature?.metric?.value) ?? 0}°",
            style: const TextStyle(fontSize: 90, color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0.0, left: 13.w),
          child: Text(
            "${temperature?.weatherText}",
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: Text(
            "H: ${convertFtoC(forecastTimeEntity?.dailyForecasts?.first.temperature?.maximum?.value ?? 0)}°C   L: ${convertFtoC(forecastTimeEntity?.dailyForecasts?.first.temperature?.minimum?.value ?? 0)}°C",
            style: TextStyle(
                fontSize: 17.sp,
                color: Colors.white,
                fontFamily: FontFamily.lexend),
          ),
        ),
      ],
    );
  }
}
