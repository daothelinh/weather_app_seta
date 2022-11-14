import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../models/forecast_day/forecast_day.dart';

part 'service_forecast_day.g.dart';

@RestApi()
@injectable
abstract class ServiceForecastDay {
  @factoryMethod
  factory ServiceForecastDay(Dio dio) = _ServiceForecastDay;

  @GET("/forecasts/v1/daily/5day/{locationKey}")
  Future<ForecastDay> getDataForecastDay({
    @Path('locationKey') required int locationkey,
    @Query('apikey') required String apikey,
  });
}
