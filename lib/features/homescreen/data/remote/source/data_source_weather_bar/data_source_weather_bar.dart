import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weather_bar.dart';

abstract class DataSourceWeatherBar {
  Future<List<WeatherBar>> getData();
}
