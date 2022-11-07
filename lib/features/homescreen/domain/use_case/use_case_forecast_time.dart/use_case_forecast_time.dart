import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_time/forecast_time_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ForecastTimeUsecase {
  Future<Either<BaseError, ForecastTimeEntity>> getDataForecastTime();
}
