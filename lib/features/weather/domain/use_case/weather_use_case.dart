import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/features/weather/data/model/focast_time/forecast_time.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/city_model.dart';
import '../../data/model/location/location.dart';

abstract class WeatherUseCase {
  Future<Either<BaseError, List<CityModel>>> getCity({required String q});
  Future<Either<BaseError, List<Location>>> getLocation(
      {required String locationKey});
  Future<Either<BaseError, ForecastTime>> getForecast(
      {required String locationKey});
}
