import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_date_time/forecast_date_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_day/forecast_day_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_time/forecast_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/weatherbar/weather_bar_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DefaultLocationRepo {
  Future<Either<BaseError, List<WeatherBarEntity>>> getData(
      {required String locationKey});
  Future<Either<BaseError, ForecastTimeEntity>> getDataForecastTime(
      {required String locationKey});
  Future<Either<BaseError, List<ForecastDateTimeEntity>>>
      getDataForecastDateTime({required String locationKey});
  Future<Either<BaseError, ForecastDayEntity>> getDataForecastDay(
      {required String locationKey});
}
