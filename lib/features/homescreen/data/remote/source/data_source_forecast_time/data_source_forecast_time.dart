import '../../models/forecast_time/forecast_time.dart';

abstract class DataSourceForecastTime {
  Future<ForecastTime> getDataForecastTime();
}
