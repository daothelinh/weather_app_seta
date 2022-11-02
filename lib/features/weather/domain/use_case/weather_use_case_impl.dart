import 'package:base_bloc_3/features/weather/domain/entity/city_entity.dart';
import 'package:base_bloc_3/features/weather/domain/entity/area_entity.dart';
import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/features/weather/domain/repository/weather_repository.dart';
import 'package:base_bloc_3/features/weather/domain/use_case/weather_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WeatherUseCase)
class WeatherUseCaseImpl implements WeatherUseCase {
  WeatherUseCaseImpl(this._repo);
  final WeatherRepository _repo;
  @override
  Future<Either<BaseError, AreaEntity>> getArea({required String locationKey}) {
    return _repo.getArea(locationKey: locationKey);
  }

  @override
  Future<Either<BaseError, List<CityEntity>>> getCity(
      {required int offset, required String q}) {
    return _repo.getCity(offset: offset, q: q);
  }
}
