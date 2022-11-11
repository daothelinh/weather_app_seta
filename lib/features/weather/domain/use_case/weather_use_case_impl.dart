import 'package:base_bloc_3/features/weather/data/model/city_model.dart';
import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/features/weather/data/model/location/location.dart';
import 'package:base_bloc_3/features/weather/data/model/focast_time/forecast_time.dart';
import 'package:base_bloc_3/features/weather/domain/repository/weather_repo.dart';
import 'package:base_bloc_3/features/weather/domain/use_case/weather_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WeatherUseCase)
class WeatherUseCaseImpl implements WeatherUseCase {
  WeatherUseCaseImpl(this._repo);
  final WeatherRepository _repo;
  @override
  Future<Either<BaseError, List<CityModel>>> getCity({required String q}) {
    return _repo.getCity(q: q);
  }

  @override
  Future<Either<BaseError, ForecastTime>> getForecast(
      {required String locationKey}) {
    return _repo.getForecast(locationKey: locationKey);
  }

  @override
  Future<Either<BaseError, List<Location>>> getLocation(
      {required String locationKey}) {
    return _repo.getLocation(locationKey: locationKey);
  }
}
