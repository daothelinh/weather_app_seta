import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/base/network/errors/extension.dart';
import 'package:base_bloc_3/features/homescreen/data/remote/source/data_source_forecast_day/data_source_day.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_day/forecast_day_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/repositories/forecast_day_time_core_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForecastDayRepo)
class ForecastDayRepoImpl implements ForecastDayRepo {
  final DataSourceForecastDay _remoteDataSourceForecastDay;

  ForecastDayRepoImpl(this._remoteDataSourceForecastDay);
  @override
  Future<Either<BaseError, ForecastDayEntity>> getDataForecastDay() async {
    try {
      final result = await _remoteDataSourceForecastDay.getDataForecastDay();
      return right(ForecastDayEntity.fromModel(result));
    } on DioError catch (exception) {
      return left(exception.baseError);
    }
  }
}
