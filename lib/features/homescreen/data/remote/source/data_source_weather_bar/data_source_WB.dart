import 'package:base_bloc_3/base/network/models/base_data.dart';
import 'package:base_bloc_3/features/homescreen/data/models/forecast_time/forecast_time.dart';
import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weatherBar.dart';

abstract class DataSourceWB {
  Future<List<WeatherBar>> getData();
}
