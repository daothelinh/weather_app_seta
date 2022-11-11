import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../model/city_model.dart';
import '../../model/focast_time/forecast_time.dart';
import '../../model/location/location.dart';

part 'weather_service.g.dart';

@RestApi()
@injectable
abstract class WeatherService {
  @factoryMethod
  factory WeatherService(Dio dio) = _WeatherService;

  @GET('/locations/v1/cities/search')
  Future<List<CityModel>> getCity({
    @Query('apikey') required String apikey,
    @Query('q') required String q,
    @Query('language') required String language,
    @Query('details') required bool details,
    @Query('offset') required double offset,
    @Query('alias') required String alias,
  });

  @GET('/forecasts/v1/daily/1day/{locationKey}')
  Future<ForecastTime> getForecast({
    @Path('locationKey') required String locationKey,
    @Query('apikey') required String apikey,
    @Query('language') required String language,
    @Query('details') required bool details,
    @Query('offset') required bool metric,
  });

  @GET('/currentconditions/v1/{locationKey}')
  Future<List<Location>> getLocation({
    @Path('locationKey') required String locationKey,
    @Query('apikey') required String apikey,
    @Query('language') required String language,
    @Query('details') required bool details,
  });
}
