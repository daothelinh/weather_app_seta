import '../../../models/forecast_date_time/forecast_date_time.dart';

abstract class DataSourceForecastDateTime {
  Future<List<ForecastDateTime>> getDataForecastDateTime();
}
