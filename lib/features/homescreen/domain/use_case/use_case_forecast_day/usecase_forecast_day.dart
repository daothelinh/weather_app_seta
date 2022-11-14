import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_day/forecast_day_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ForecastDayUsecase {
  Future<Either<BaseError, ForecastDayEntity>> getDataForecastDay();
}
