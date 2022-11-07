import 'package:base_bloc_3/common/local_data/app_token.dart';
import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weatherBar.dart';
import 'package:base_bloc_3/features/homescreen/data/remote/service/serviceWB.dart';
import 'package:injectable/injectable.dart';

import 'data_source_WB.dart';

@Injectable(as: DataSourceWB)
class DataSourceWBImpl implements DataSourceWB {
  DataSourceWBImpl(this._service);

  final serviceWB _service;

  @override
  Future<List<WeatherBar>> getData(
      //   {
      //   required int locationkey,
      //   required String apikey,
      // }
      ) {
    return _service.getData(
      locationkey: AppToken.locationkey,
      apikey: AppToken.token,
    );
  }
}
