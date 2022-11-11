import 'package:base_bloc_3/base/network/errors/extension.dart';
import 'package:base_bloc_3/features/weather/data/model/location/location.dart';
import 'package:base_bloc_3/features/weather/data/model/focast_time/forecast_time.dart';
import 'package:base_bloc_3/features/weather/data/remote/source/weather_source.dart';
import 'package:dartz/dartz.dart';

import 'package:base_bloc_3/features/weather/data/model/city_model.dart';

import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/weather_repo.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherSource _source;
  WeatherRepositoryImpl(this._source);
  @override
  Future<Either<BaseError, List<CityModel>>> getCity(
      {required String q}) async {
    try {
      final res = await _source.getCity(q: q);
      return right(res);
    } on DioError catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, ForecastTime>> getForecast(
      {required String locationKey}) async {
    try {
      final res = await _source.getForecast(locationKey: locationKey);
      return right(res);
    } on DioError catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<Location>>> getLocation(
      {required String locationKey}) async {
    try {
      final res = await _source.getLocation(locationKey: locationKey);
      return right(res);
    } on DioError catch (e) {
      return left(e.baseError);
    }
  }
}
