import 'package:base_bloc_3/base/network/models/base_data.dart';
import 'package:base_bloc_3/features/weather/data/model/city_model.dart';

import '../../model/area/area_model.dart';

abstract class WeatherDataSource {
  Future<List<CityModel>> getCity({
    required String text,
    required int offset,
  });

  Future<AreaModel> getArea({required String key});
}
