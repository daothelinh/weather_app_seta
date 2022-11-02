import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';
import '../entity/area_entity.dart';
import '../entity/city_entity.dart';

abstract class WeatherUseCase {
  Future<Either<BaseError, AreaEntity>> getArea({
    required String locationKey,
  });
  Future<Either<BaseError, List<CityEntity>>> getCity({
    required int offset,
    required String q,
  });
}
