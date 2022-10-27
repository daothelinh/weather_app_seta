import 'package:base_bloc_3/base/network/errors/error_handling.dart';
import 'package:base_bloc_3/base/network/errors/extension.dart';
import 'package:base_bloc_3/features/weather/data/remote/source/weather_data_source.dart';
import 'package:base_bloc_3/features/weather/domain/entity/index.dart';
import 'package:dartz/dartz.dart';
import 'package:base_bloc_3/features/weather/domain/entity/city_entity.dart';
import 'package:base_bloc_3/features/weather/domain/entity/area_entity.dart';
import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/weather_repository.dart';
import '../model/city_model.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(this._dataSource);
  final WeatherDataSource _dataSource;
  @override
  Future<Either<BaseError, List<AreaEntity>>> getArea(
      {required int offset, required int limit}) {
    // TODO: implement getArea
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<CityEntity>>> getCity({
    required int offset,
    required String q,
  }) async {
    try {
      final result = await _dataSource.getCity(offset: offset, text: q);
      // print(result);
      return right(result.map((e) => CityEntity.fromModel(e)).toList());
    } on DioError catch (exeption) {
      print(exeption.type);
      print(exeption.baseError);
      return left(exeption.baseError);
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }
}
