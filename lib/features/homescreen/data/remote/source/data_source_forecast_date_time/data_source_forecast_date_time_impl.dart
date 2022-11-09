import 'package:injectable/injectable.dart';

import '../../../../../../common/local_data/app_token.dart';
import '../../../models/forecast_date_time/forecast_date_time.dart';
import '../../service/service_forecast_date_time/service_forecast_date_time.dart';
import 'data_source_forecast_date_time.dart';

@Injectable(as: DataSourceForecastDateTime)
class DataSourceForcecastDateTimeImpl implements DataSourceForecastDateTime {
  final ServiceForecastDateTime _serviceForecastDateTime;

  DataSourceForcecastDateTimeImpl(this._serviceForecastDateTime);
  @override
  Future<List<ForecastDateTime>> getDataForecastDateTime() {
    return _serviceForecastDateTime.getDataForecastDateTime(
      locationkey: AppToken.locationkey,
      apikey: AppToken.token,
    );
  }
}
