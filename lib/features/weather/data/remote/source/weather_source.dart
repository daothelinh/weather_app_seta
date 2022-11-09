import '../../model/area_model.dart';

abstract class WeatherSource {
  Future<List<AreaModel>> getArea({required String q});
}
