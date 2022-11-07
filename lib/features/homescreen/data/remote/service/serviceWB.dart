import 'package:base_bloc_3/features/homescreen/data/models/forecast_time/forecast_time.dart';
import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weatherBar.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../../base/network/models/base_data.dart';

part 'serviceWB.g.dart';

@RestApi()
@injectable
abstract class serviceWB {
  @factoryMethod
  factory serviceWB(Dio dio) = _serviceWB;

  @GET("/currentconditions/v1/{locationKey}")
  Future<List<WeatherBar>> getData({
    @Path('locationKey') required int locationkey,
    @Query('apikey') required String apikey,
    // @Query('page') required int offset,
    // @Query('per_page') required int limit,
  });

  @GET("/forecasts/v1/daily/1day/{locationKey}")
  Future<ForecastTime> getDataForecastTime({
    @Path('locationKey') required int locationkey,
    @Query('apikey') required String apikey,
  });
}
