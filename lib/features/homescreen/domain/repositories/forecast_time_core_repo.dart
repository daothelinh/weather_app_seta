import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_time/forecast_time_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';

abstract class ForeCastTimeRepo {
  Future<Either<BaseError, ForecastTimeEntity>> getDataForecastTime();
}
