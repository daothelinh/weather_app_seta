import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../models/forecast_date_time/forecast_date_time.dart';

part 'service_forecast_date_time.g.dart';

@RestApi()
@injectable
abstract class ServiceForecastDateTime {
  @factoryMethod
  factory ServiceForecastDateTime(Dio dio) = _ServiceForecastDateTime;
  @GET("/forecasts/v1/hourly/12hour//{locationKey}")
  Future<List<ForecastDateTime>> getDataForecastDateTime({
    @Path('locationKey') required int locationkey,
    @Query('apikey') required String apikey,
  });
}
