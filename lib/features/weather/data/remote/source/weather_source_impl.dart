import 'package:base_bloc_3/common/local_data/app_token.dart';
import 'package:base_bloc_3/features/weather/data/model/area_model.dart';
import 'package:base_bloc_3/features/weather/data/remote/service/weather_service.dart';
import 'package:base_bloc_3/features/weather/data/remote/source/weather_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WeatherSource)
class WeatherSourceImpl implements WeatherSource {
  WeatherSourceImpl(this._service);
  final WeatherService _service;
  @override
  Future<List<AreaModel>> getArea({required String q}) {
    return _service.getArea(
      apikey: AppToken.token,
      q: q,
      language: AppToken.language,
      details: AppToken.detail,
      offset: 10,
      alias: AppToken.alias,
    );
  }
}
