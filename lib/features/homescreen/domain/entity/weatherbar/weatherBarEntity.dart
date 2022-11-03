import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weatherBar.dart';

class WeatherBarEntity {
  final String? weatherText;
  final Temperature? temperature;

  WeatherBarEntity({this.weatherText, this.temperature});

  factory WeatherBarEntity.fromModel(WeatherBar weatherBar) => WeatherBarEntity(
        weatherText: weatherBar.weatherText,
        temperature: weatherBar.temperature,
      );
}
