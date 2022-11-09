import 'package:base_bloc_3/base/network/errors/extension.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/network/errors/error.dart';
import '../../domain/entity/forecast_date_time/forecast_date_time_entity.dart';
import '../../domain/repositories/forecast_date_time_core_repo.dart';
import '../remote/source/data_source_forecast_date_time/data_source_forecast_date_time.dart';

@Injectable(as: ForecastDateTimeRepo)
class ForeCastDateTimeRepoImpl implements ForecastDateTimeRepo {
  ForeCastDateTimeRepoImpl(this._remoteDataSourceForecastDateTime);
  final DataSourceForecastDateTime _remoteDataSourceForecastDateTime;

  @override
  Future<Either<BaseError, List<ForecastDateTimeEntity>>>
      getDataForecastDateTime() async {
    try {
      final result =
          await _remoteDataSourceForecastDateTime.getDataForecastDateTime();
      return right(
          result.map((e) => ForecastDateTimeEntity.fromModel(e)).toList());
    } on DioError catch (exception) {
      return left(exception.baseError);
    }
  }
}
