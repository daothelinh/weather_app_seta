import 'dart:math';

import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/base/network/errors/extension.dart';
import 'package:base_bloc_3/features/homescreen/data/remote/source/data_source_WB.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/weatherbar/weatherBarEntity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/weatherBar_coreRepo.dart';

@Injectable(as: WeatherbarRepo)
class WeatherbarRepoImpl implements WeatherbarRepo {
  WeatherbarRepoImpl(this._remoteDataSource);
  final DataSourceWB _remoteDataSource;

  @override
  Future<Either<BaseError, List<WeatherBarEntity>>> getData(
      //   {
      //   required int locationkey,
      //   required String apikey,
      // }
      ) async {
    try {
      final result = await _remoteDataSource.getData(
          // locationkey: locationkey,
          // apikey: apikey,
          );
      return right((result.data ?? [])
          .map((e) => WeatherBarEntity.fromModel(e))
          .toList());
    } on DioError catch (exception) {
      return left(exception.baseError);
    }
  }
}
