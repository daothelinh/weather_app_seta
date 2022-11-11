import 'package:base_bloc_3/features/weather/data/model/focast_time/forecast_time.dart';

import '../../model/city_model.dart';
import '../../model/location/location.dart';

abstract class WeatherSource {
  Future<List<CityModel>> getCity({required String q});
  Future<ForecastTime> getForecast({required String locationKey});
  Future<List<Location>> getLocation({required String locationKey});
}
