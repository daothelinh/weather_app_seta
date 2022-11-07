import 'package:base_bloc_3/common/local_data/app_token.dart';
import 'package:base_bloc_3/features/homescreen/data/models/forecast_time/forecast_time.dart';
import 'package:base_bloc_3/features/homescreen/data/remote/service/serviceWB.dart';
import 'package:base_bloc_3/features/homescreen/data/remote/source/data_source_forecast_time/data_source_forecast_time.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DataSourceForecastTime)
class DataSourceForcecastTimeImpl implements DataSourceForecastTime {
  final serviceWB _serviceForecastTime;

  DataSourceForcecastTimeImpl(this._serviceForecastTime);
  @override
  Future<ForecastTime> getDataForecastTime() {
    return _serviceForecastTime.getDataForecastTime(
      locationkey: AppToken.locationkey,
      apikey: AppToken.token,
    );
  }
}
