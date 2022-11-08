import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weather_bar.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'service_weather_bar.g.dart';

@RestApi()
@injectable
abstract class ServiceWeatherBar {
  @factoryMethod
  factory ServiceWeatherBar(Dio dio) = _ServiceWeatherBar;

  @GET("/currentconditions/v1/{locationKey}")
  Future<List<WeatherBar>> getData({
    @Path('locationKey') required int locationkey,
    @Query('apikey') required String apikey,
  });
}
