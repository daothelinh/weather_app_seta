import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/base/network/errors/extension.dart';
import 'package:base_bloc_3/features/homescreen/data/remote/source/data_source_forecast_time/data_source_forecast_time.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_time/forecast_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/repositories/forecast_time_core_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForeCastTimeRepo)
class ForecastTimeRepoImpl implements ForeCastTimeRepo {
  final DataSourceForecastTime _remoteDataSourceForecastTime;

  ForecastTimeRepoImpl(this._remoteDataSourceForecastTime);
  @override
  Future<Either<BaseError, ForecastTimeEntity>> getDataForecastTime() async {
    try {
      final result = await _remoteDataSourceForecastTime.getDataForecastTime();
      return right(ForecastTimeEntity.fromModel(result));
    } on DioError catch (exception) {
      return left(exception.baseError);
    }
  }
}
