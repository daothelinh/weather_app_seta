import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../model/area_model.dart';

part 'weather_service.g.dart';

@RestApi()
@injectable
abstract class WeatherService {
  @factoryMethod
  factory WeatherService(Dio dio) = _WeatherService;

  @GET('/locations/v1/cities/search')
  Future<List<AreaModel>> getArea({
    @Query('apikey') required String apikey,
    @Query('q') required String q,
    @Query('language') required String language,
    @Query('details') required bool details,
    @Query('offset') required double offset,
    @Query('alias') required String alias,
  });
}
