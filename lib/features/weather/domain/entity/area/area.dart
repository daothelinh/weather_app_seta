import 'package:base_bloc_3/features/weather/data/model/focast_time/forecast_time.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../data/model/location/location.dart';

part 'area.g.dart';

@CopyWith()
class Area {
  final String? key;
  final Location? location;
  final ForecastTime? forecastTime;

  Area({this.location, this.forecastTime, this.key});
}
