import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_date_time/forecast_date_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_day/forecast_day_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_time/forecast_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/weatherbar/weather_bar_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/repositories/default_location_core_repo.dart';
import 'package:base_bloc_3/features/homescreen/domain/use_case/default_location_use_case/default_location_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DefaultLocationUseCase)
class DefaultLocationUseCaseImpl implements DefaultLocationUseCase {
  DefaultLocationUseCaseImpl(this._coreRepo);

  final DefaultLocationRepo _coreRepo;

  @override
  Future<Either<BaseError, List<WeatherBarEntity>>> getData(
      {required String locationKey}) {
    return _coreRepo.getData(locationKey: locationKey);
  }

  @override
  Future<Either<BaseError, ForecastTimeEntity>> getDataForecastTime(
      {required String locationKey}) {
    return _coreRepo.getDataForecastTime(locationKey: locationKey);
  }

  @override
  Future<Either<BaseError, List<ForecastDateTimeEntity>>>
      getDataForecastDateTime({required String locationKey}) {
    return _coreRepo.getDataForecastDateTime(locationKey: locationKey);
  }

  @override
  Future<Either<BaseError, ForecastDayEntity>> getDataForecastDay(
      {required String locationKey}) {
    return _coreRepo.getDataForecastDay(locationKey: locationKey);
  }
}
