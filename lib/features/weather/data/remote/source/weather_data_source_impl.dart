import 'package:base_bloc_3/common/local_data/app_token.dart';
import 'package:base_bloc_3/features/weather/data/model/city_model.dart';

import 'package:base_bloc_3/base/network/models/base_data.dart';
import 'package:base_bloc_3/features/weather/data/remote/service/weather_service.dart';
import 'package:injectable/injectable.dart';

import 'weather_data_source.dart';

@Injectable(as: WeatherDataSource)
class WeatherDataSourceImpl implements WeatherDataSource {
  WeatherDataSourceImpl(this._service);
  final WeatherService _service;
  @override
  Future<BaseListData<CityModel>> getCity(
      {required String text, required int offset}) {
    return _service.getCity(
      token: AppToken.token,
      q: text,
      language: AppToken.language,
      details: AppToken.detail,
      offset: offset,
      alias: AppToken.alias,
    );
  }
}
