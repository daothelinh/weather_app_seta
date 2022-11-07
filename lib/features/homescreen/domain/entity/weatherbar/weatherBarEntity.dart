import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weatherBar.dart';

class WeatherBarEntity {
  final String? weatherText;
  final TemperatureEntity? temperature;

  WeatherBarEntity({this.weatherText, this.temperature});

  factory WeatherBarEntity.fromModel(WeatherBar weatherBar) => WeatherBarEntity(
        weatherText: weatherBar.weatherText,
        temperature: TemperatureEntity.fromModel(
          weatherBar.temperature!,
        ),
      );
}

class TemperatureEntity {
  final MetricEntity? metric;
  TemperatureEntity({this.metric});
  factory TemperatureEntity.fromModel(Temperature temperature) =>
      TemperatureEntity(metric: MetricEntity.fromModel(temperature.metric!));
}

class MetricEntity {
  final double? value;
  MetricEntity({this.value});

  factory MetricEntity.fromModel(Metric metric) =>
      MetricEntity(value: metric.value);
}
