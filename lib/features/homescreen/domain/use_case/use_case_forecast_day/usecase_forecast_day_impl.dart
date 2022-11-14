import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_day/forecast_day_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/repositories/forecast_day_time_core_repo.dart';
import 'package:base_bloc_3/features/homescreen/domain/use_case/use_case_forecast_day/usecase_forecast_day.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForecastDayUsecase)
class ForecastDayUsecaseImpl implements ForecastDayUsecase {
  final ForecastDayRepo _forecastDayRepo;

  ForecastDayUsecaseImpl(this._forecastDayRepo);
  @override
  Future<Either<BaseError, ForecastDayEntity>> getDataForecastDay() {
    return _forecastDayRepo.getDataForecastDay();
  }
}
