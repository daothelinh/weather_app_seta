import 'package:base_bloc_3/features/homescreen/data/models/forecast_date_time/forecast_date_time.dart';

class ForecastDateTimeEntity {
  final String? dateTime;
  final TemperatureDateTime? temperature;

  ForecastDateTimeEntity({this.dateTime, this.temperature});

  factory ForecastDateTimeEntity.fromModel(ForecastDateTime forecastDateTime) =>
      ForecastDateTimeEntity(
          dateTime: forecastDateTime.dateTime!,
          temperature:
              TemperatureDateTime.fromModel(forecastDateTime.temperature!));
}

class TemperatureDateTime {
  final double? temperatureDateTime;

  TemperatureDateTime({this.temperatureDateTime});

  factory TemperatureDateTime.fromModel(Temperature temperature) =>
      TemperatureDateTime(temperatureDateTime: temperature.value);
}
