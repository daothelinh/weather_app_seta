import 'package:freezed_annotation/freezed_annotation.dart';
part 'forecastTime.freezed.dart';
part 'forecastTime.g.dart';

@freezed
class Temperature with _$Temperature {
  const factory Temperature({
    final int? value,
    final String? unit,
    final int? unitType,
  }) = _Temperature;

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}

@freezed
class ForeCastTime with _$ForeCastTime {
  const factory ForeCastTime({
    final String? dateTime,
    final int? epochDateTime,
    final int? weatherIcon,
    final String? iconPhrase,
    final bool? hasPrecipitation,
    final String? precipitationType,
    final String? precipitationIntensity,
    final bool? isDaylight,
    final Temperature? temperature,
    final int? precipitationProbability,
    final String? mobileLink,
    final String? link,
  }) = _ForeCastTime;

  factory ForeCastTime.fromJson(Map<String, dynamic> json) =>
      _$ForeCastTimeFromJson(json);
}
