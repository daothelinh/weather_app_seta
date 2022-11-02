import 'package:base_bloc_3/features/weather/data/model/city_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../../base/network/models/base_data.dart';
import '../../model/area/area_model.dart';

part 'weather_service.g.dart';

@RestApi()
@injectable
abstract class WeatherService {
  @factoryMethod
  factory WeatherService(Dio dio) = _WeatherService;

  @GET('/locations/v1/cities/search')
  Future<List<CityModel>> getCity({
    @Query('apikey') required String token,
    @Query('q') required String q,
    @Query('language') required String language,
    @Query('details') required bool details,
    @Query('offset') required int offset,
    @Query('alias') required String alias,
  });

  @GET('/forecasts/v1/daily/1day/{locationKey}')
  Future<AreaModel> getArea(
      {@Path('locationKey') required String key,
      @Query('apikey') required String token,
      @Query('language') required String language,
      @Query('details') required bool details,
      @Query('metric') required bool metric});
}
