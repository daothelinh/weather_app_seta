import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

@RestApi()
@injectable
abstract class WeatherService {
  // @factoryMethod
  // factory WeatherService(Dio dio) => _WeatherService;

  // @GET('/')
}
