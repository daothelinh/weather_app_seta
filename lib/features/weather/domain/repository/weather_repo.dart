import 'package:base_bloc_3/features/weather/data/model/city_model.dart';
import 'package:base_bloc_3/features/weather/data/model/focast_time/forecast_time.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';
import '../../data/model/location/location.dart';

abstract class WeatherRepository {
  Future<Either<BaseError, List<CityModel>>> getCity({required String q});
  Future<Either<BaseError, List<Location>>> getLocation(
      {required String locationKey});
  Future<Either<BaseError, ForecastTime>> getForecast(
      {required String locationKey});
}
