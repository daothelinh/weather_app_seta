import 'package:base_bloc_3/features/homescreen/domain/entity/weatherbar/weather_bar_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';

abstract class WeatherbarRepo {
  Future<Either<BaseError, List<WeatherBarEntity>>> getData(
      // {
      // required int locationkey,
      // required String apikey,
      // }
      );
}
