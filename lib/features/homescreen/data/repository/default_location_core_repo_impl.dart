import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/base/network/errors/extension.dart';
import 'package:base_bloc_3/features/homescreen/data/remote/source/default_location_datasource/default_location_data_source.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_date_time/forecast_date_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_day/forecast_day_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_time/forecast_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/weatherbar/weather_bar_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/repositories/default_location_core_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DefaultLocationRepo)
class DefaultLocationRepoImpl implements DefaultLocationRepo {
  DefaultLocationRepoImpl(this._remoteDataSource);
  final DefaultLocationDataSource _remoteDataSource;

  @override
  Future<Either<BaseError, List<WeatherBarEntity>>> getData(
      {required String locationKey}) async {
    try {
      final result = await _remoteDataSource.getData(locationKey: locationKey);
      return right(result.map((e) => WeatherBarEntity.fromModel(e)).toList());
    } on DioError catch (exception) {
      return left(exception.baseError);
    }
  }

  @override
  Future<Either<BaseError, ForecastTimeEntity>> getDataForecastTime(
      {required String locationKey}) async {
    try {
      final result =
          await _remoteDataSource.getDataForecastTime(locationKey: locationKey);
      return right(ForecastTimeEntity.fromModel(result));
    } on DioError catch (exception) {
      return left(exception.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<ForecastDateTimeEntity>>>
      getDataForecastDateTime({required String locationKey}) async {
    try {
      final result = await _remoteDataSource.getDataForecastDateTime(
          locationKey: locationKey);
      return right(
          result.map((e) => ForecastDateTimeEntity.fromModel(e)).toList());
    } on DioError catch (exception) {
      return left(exception.baseError);
    }
  }

  @override
  Future<Either<BaseError, ForecastDayEntity>> getDataForecastDay(
      {required String locationKey}) async {
    try {
      final result =
          await _remoteDataSource.getDataForecastDay(locationKey: locationKey);
      return right(ForecastDayEntity.fromModel(result));
    } on DioError catch (exception) {
      return left(exception.baseError);
    }
  }
}
