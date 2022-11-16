import 'package:base_bloc_3/common/local_data/app_token.dart';
import 'package:base_bloc_3/features/homescreen/data/models/forecast_date_time/forecast_date_time.dart';
import 'package:base_bloc_3/features/homescreen/data/models/forecast_day/forecast_day.dart';
import 'package:base_bloc_3/features/homescreen/data/models/forecast_time/forecast_time.dart';
import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weather_bar.dart';
import 'package:base_bloc_3/features/homescreen/data/remote/service/default_location_service/default_location_service.dart';
import 'package:base_bloc_3/features/homescreen/data/remote/source/default_location_datasource/default_location_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DefaultLocationDataSource)
class DefaultLocationDataSourceImpl implements DefaultLocationDataSource {
  DefaultLocationDataSourceImpl(this._service);

  final DefaultLocationService _service;

  @override
  Future<List<WeatherBar>> getData({required String locationKey}) {
    return _service.getData(
      locationkey: locationKey,
      apikey: AppToken.token,
    );
  }

  @override
  Future<ForecastTime> getDataForecastTime({required String locationKey}) {
    return _service.getDataForecastTime(
      locationkey: locationKey,
      apikey: AppToken.token,
    );
  }

  @override
  Future<List<ForecastDateTime>> getDataForecastDateTime(
      {required String locationKey}) {
    return _service.getDataForecastDateTime(
      locationkey: locationKey,
      apikey: AppToken.token,
    );
  }

  @override
  Future<ForecastDay> getDataForecastDay({required String locationKey}) {
    return _service.getDataForecastDay(
      locationkey: locationKey,
      apikey: AppToken.token,
    );
  }
}
