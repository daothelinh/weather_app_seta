import '../../../models/forecast_day/forecast_day.dart';

abstract class DataSourceForecastDay {
  Future<ForecastDay> getDataForecastDay();
}
