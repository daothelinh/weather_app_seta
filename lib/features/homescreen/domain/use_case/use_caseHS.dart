import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';
import '../entity/weatherbar/weatherBarEntity.dart';

abstract class HomescreenUseCase {
  Future<Either<BaseError, List<WeatherBarEntity>>> getData(
      //   {
      //   required int locationkey,
      //   required String apikey,
      // }
      );
}
