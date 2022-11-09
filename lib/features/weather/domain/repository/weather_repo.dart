import 'package:base_bloc_3/features/weather/data/model/area_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';

abstract class WeatherRepository {
  Future<Either<BaseError, List<AreaModel>>> getArea({required String q});
}
