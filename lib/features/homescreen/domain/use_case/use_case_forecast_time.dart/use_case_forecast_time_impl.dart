import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_time/forecast_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/repositories/forecast_time_coreRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'use_case_forecast_time.dart';

@Injectable(as: ForecastTimeUsecase)
class ForecastTimeUsecaseImpl implements ForecastTimeUsecase {
  final ForeCastTimeRepo _foreCastTimeRepo;

  ForecastTimeUsecaseImpl(this._foreCastTimeRepo);
  @override
  Future<Either<BaseError, ForecastTimeEntity>> getDataForecastTime() {
    return _foreCastTimeRepo.getDataForecastTime();
  }
}
