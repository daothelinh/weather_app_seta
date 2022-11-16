import 'package:base_bloc_3/features/homescreen/data/models/forecast_date_time/forecast_date_time.dart';
import 'package:base_bloc_3/features/homescreen/data/models/forecast_day/forecast_day.dart';
import 'package:base_bloc_3/features/homescreen/data/models/forecast_time/forecast_time.dart';
import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weather_bar.dart';

abstract class DefaultLocationDataSource {
  Future<List<WeatherBar>> getData({required String locationKey});
  Future<ForecastTime> getDataForecastTime({required String locationKey});
  Future<List<ForecastDateTime>> getDataForecastDateTime(
      {required String locationKey});
  Future<ForecastDay> getDataForecastDay({required String locationKey});
}
