import 'package:dartz/dartz.dart';

import '../../../../../base/network/errors/error.dart';
import '../../entity/forecast_date_time/forecast_date_time_entity.dart';

abstract class ForecastDateTimeUsecase {
  Future<Either<BaseError, List<ForecastDateTimeEntity>>>
      getDataForecastDateTime();
}
