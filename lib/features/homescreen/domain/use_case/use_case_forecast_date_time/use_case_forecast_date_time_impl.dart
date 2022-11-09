import 'package:base_bloc_3/features/homescreen/domain/use_case/use_case_forecast_date_time/use_case_forecast_date_time.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/network/errors/error.dart';
import '../../entity/forecast_date_time/forecast_date_time_entity.dart';
import '../../repositories/forecast_date_time_core_repo.dart';

@Injectable(as: ForecastDateTimeUsecase)
class ForecastDateTimeUsecaseImpl implements ForecastDateTimeUsecase {
  final ForecastDateTimeRepo _foreCastDateTimeRepo;

  ForecastDateTimeUsecaseImpl(this._foreCastDateTimeRepo);
  @override
  Future<Either<BaseError, List<ForecastDateTimeEntity>>>
      getDataForecastDateTime() {
    return _foreCastDateTimeRepo.getDataForecastDateTime();
  }
}
