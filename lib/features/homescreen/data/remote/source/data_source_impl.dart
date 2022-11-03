import 'package:base_bloc_3/base/network/models/base_data.dart';
import 'package:base_bloc_3/common/local_data/app_token.dart';
import 'package:base_bloc_3/features/homescreen/data/models/weatherbar/weatherBar.dart';
import 'package:base_bloc_3/features/homescreen/data/remote/service/serviceWB.dart';
import 'package:base_bloc_3/features/homescreen/data/remote/source/data_source_WB.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DataSourceWB)
class DataSourceImpl implements DataSourceWB {
  DataSourceImpl(this._service);

  final serviceWB _service;

  @override
  Future<BaseListData<WeatherBar>> getData(
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
