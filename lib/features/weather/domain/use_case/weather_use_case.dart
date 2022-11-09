import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/area_model.dart';

abstract class WeatherUseCase {
  Future<Either<BaseError, List<AreaModel>>> getArea({required String q});
}
