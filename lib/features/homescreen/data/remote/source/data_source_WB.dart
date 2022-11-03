import 'package:base_bloc_3/base/network/models/base_data.dart';
import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weatherBar.dart';

abstract class DataSourceWB {
  Future<BaseListData<WeatherBar>> getData(
      //   {
      //   required int locationkey,
      //   required String apikey,
      // }
      );
}
