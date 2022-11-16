import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_time/forecast_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/weatherbar/weather_bar_entity.dart';
import 'package:base_bloc_3/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class WeatherBarWidget extends StatelessWidget {
  const WeatherBarWidget({
    super.key,
    this.temperature,
    this.forecastTimeEntity,
  });
  final WeatherBarEntity? temperature;
  final ForecastTimeEntity? forecastTimeEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 78),
          child: Text(
            "Hanoi",
            style: TextStyle(fontSize: 37, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, top: 10),
          child: Text(
            "${(temperature?.temperature?.metric?.value) ?? 0}°",
            style: const TextStyle(fontSize: 90, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 13),
          child: Text(
            "${temperature?.weatherText}",
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            "H: ${(forecastTimeEntity?.dailyForecasts?.first.temperature?.maximum?.value ?? 0) - 56.9}°C   L: ${(forecastTimeEntity?.dailyForecasts?.first.temperature?.minimum?.value ?? 0) - 48}°C",
            style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontFamily: FontFamily.lexend),
          ),
        ),
      ],
    );
  }
}
