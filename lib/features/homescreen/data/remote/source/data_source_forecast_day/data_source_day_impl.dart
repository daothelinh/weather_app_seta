import 'package:injectable/injectable.dart';

import '../../../../../../common/local_data/app_token.dart';
import '../../../models/forecast_day/forecast_day.dart';
import '../../service/service_forecast_day/service_forecast_day.dart';
import 'data_source_day.dart';

@Injectable(as: DataSourceForecastDay)
class DataSourceForcecastDayImpl implements DataSourceForecastDay {
  final ServiceForecastDay _serviceForecastDay;

  DataSourceForcecastDayImpl(this._serviceForecastDay);
  @override
  Future<ForecastDay> getDataForecastDay() {
    return _serviceForecastDay.getDataForecastDay(
      locationkey: AppToken.locationkey,
      apikey: AppToken.token,
    );
  }
}
