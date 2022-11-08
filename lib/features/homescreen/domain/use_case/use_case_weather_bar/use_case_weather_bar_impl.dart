import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/weatherbar/weatherBarEntity.dart';
import 'package:base_bloc_3/features/homescreen/domain/repositories/weatherBar_coreRepo.dart';
import 'package:base_bloc_3/features/homescreen/domain/use_case/use_case_weather_bar/use_case_weather_bar.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WeatherBarUseCase)
class WeatherBarUsecaseImpl implements WeatherBarUseCase {
  WeatherBarUsecaseImpl(this._coreRepo);

  final WeatherbarRepo _coreRepo;

  @override
  Future<Either<BaseError, List<WeatherBarEntity>>> getData(
      //   {
      //   required int locationkey,
      //   required String apikey,
      // }
      ) {
    return _coreRepo.getData(
        // locationkey: locationkey, apikey: apikey
        );
  }
}
