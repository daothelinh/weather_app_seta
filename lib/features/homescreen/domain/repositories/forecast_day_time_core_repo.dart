import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_day/forecast_day_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';

abstract class ForecastDayRepo {
  Future<Either<BaseError, ForecastDayEntity>> getDataForecastDay();
}
