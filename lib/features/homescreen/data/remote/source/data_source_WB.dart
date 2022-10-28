import 'package:base_bloc_3/base/network/models/base_data.dart';
import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weatherBar.dart';

abstract class DataSource {
  Future<BaseListData<WeatherBar>> getData({
    required int offset,
    required int limit,
  });
}
