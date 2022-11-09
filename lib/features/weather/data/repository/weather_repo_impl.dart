import 'package:base_bloc_3/base/network/errors/extension.dart';
import 'package:base_bloc_3/features/weather/data/remote/source/weather_source.dart';
import 'package:dartz/dartz.dart';

import 'package:base_bloc_3/features/weather/data/model/area_model.dart';

import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/weather_repo.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherSource _source;
  WeatherRepositoryImpl(this._source);
  @override
  Future<Either<BaseError, List<AreaModel>>> getArea(
      {required String q}) async {
    try {
      final res = await _source.getArea(q: q);
      return right(res);
    } on DioError catch (e) {
      return left(e.baseError);
    }
  }
}
