import 'package:base_bloc_3/common/local_data/app_token.dart';
import 'package:base_bloc_3/features/weather/data/model/city_model.dart';
import 'package:base_bloc_3/features/weather/data/model/location/location.dart';
import 'package:base_bloc_3/features/weather/data/model/focast_time/forecast_time.dart';
import 'package:base_bloc_3/features/weather/data/remote/service/weather_service.dart';
import 'package:base_bloc_3/features/weather/data/remote/source/weather_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WeatherSource)
class WeatherSourceImpl implements WeatherSource {
  WeatherSourceImpl(this._service);
  final WeatherService _service;
  @override
  Future<List<CityModel>> getCity({required String q}) {
    return _service.getCity(
      apikey: AppToken.token,
      q: q,
      language: AppToken.language,
      details: AppToken.detail,
      offset: 10,
      alias: AppToken.alias,
    );
  }

  @override
  Future<ForecastTime> getForecast({required String locationKey}) {
    return _service.getForecast(
        apikey: AppToken.token,
        locationKey: locationKey,
        language: AppToken.language,
        details: AppToken.detail,
        metric: false);
  }

  @override
  Future<List<Location>> getLocation({required String locationKey}) {
    return _service.getLocation(
      locationKey: locationKey,
      apikey: AppToken.token,
      language: AppToken.language,
      details: AppToken.detail,
    );
  }
}
