import 'package:base_bloc_3/features/homescreen/data/models/forecast_date_time/forecast_date_time.dart';
import 'package:base_bloc_3/features/homescreen/data/models/forecast_day/forecast_day.dart';
import 'package:base_bloc_3/features/homescreen/data/models/forecast_time/forecast_time.dart';
import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weather_bar.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'default_location_service.g.dart';

@RestApi()
@injectable
abstract class DefaultLocationService {
  @factoryMethod
  factory DefaultLocationService(Dio dio) = _DefaultLocationService;

  @GET("/currentconditions/v1/{locationKey}")
  Future<List<WeatherBar>> getData({
    @Path('locationKey') required String locationkey,
    @Query('apikey') required String apikey,
  });

  @GET("/forecasts/v1/daily/1day/{locationKey}")
  Future<ForecastTime> getDataForecastTime({
    @Path('locationKey') required String locationkey,
    @Query('apikey') required String apikey,
  });
  @GET("/forecasts/v1/hourly/12hour//{locationKey}")
  Future<List<ForecastDateTime>> getDataForecastDateTime({
    @Path('locationKey') required String locationkey,
    @Query('apikey') required String apikey,
  });

  @GET("/forecasts/v1/daily/5day/{locationKey}")
  Future<ForecastDay> getDataForecastDay({
    @Path('locationKey') required String locationkey,
    @Query('apikey') required String apikey,
  });
}
