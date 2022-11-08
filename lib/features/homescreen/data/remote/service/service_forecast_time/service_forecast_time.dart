import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../models/forecast_time/forecast_time.dart';

part 'service_forecast_time.g.dart';

@RestApi()
@injectable
abstract class ServiceForecastTime {
  @factoryMethod
  factory ServiceForecastTime(Dio dio) = _ServiceForecastTime;

  @GET("/forecasts/v1/daily/1day/{locationKey}")
  Future<ForecastTime> getDataForecastTime({
    @Path('locationKey') required int locationkey,
    @Query('apikey') required String apikey,
  });
}
