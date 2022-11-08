import 'package:base_bloc_3/common/local_data/app_token.dart';
import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weatherBar.dart';
import 'package:injectable/injectable.dart';

import '../../service/service_weather_bar/service_weather_bar.dart';
import 'data_source_weather_bar.dart';

@Injectable(as: DataSourceWeatherBar)
class DataSourceWBImpl implements DataSourceWeatherBar {
  DataSourceWBImpl(this._service);

  final ServiceWeatherBar _service;

  @override
  Future<List<WeatherBar>> getData(
      //   {
      //   required int locationkey,
      //   required String apikey,
      // }
      ) {
    return _service.getData(
      locationkey: AppToken.locationkey,
      apikey: AppToken.token,
    );
  }
}
