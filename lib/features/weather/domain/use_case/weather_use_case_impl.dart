import 'package:base_bloc_3/features/weather/data/model/area_model.dart';
import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/features/weather/domain/repository/weather_repo.dart';
import 'package:base_bloc_3/features/weather/domain/use_case/weather_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WeatherUseCase)
class WeatherUseCaseImpl implements WeatherUseCase {
  WeatherUseCaseImpl(this._repo);
  final WeatherRepository _repo;
  @override
  Future<Either<BaseError, List<AreaModel>>> getArea({required String q}) {
    return _repo.getArea(q: q);
  }
}
