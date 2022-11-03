import 'package:freezed_annotation/freezed_annotation.dart';
part 'weatherBar.freezed.dart';
part 'weatherBar.g.dart';

@freezed
class Metric with _$Metric {
  const factory Metric({
    final double? value,
    final String? unit,
    final int? unitType,
  }) = _Metric;

  factory Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);
}

@freezed
class Imperial with _$Imperial {
  const factory Imperial({
    final int? value,
    final String? unit,
    final int? unitType,
  }) = _Imperial;

  factory Imperial.fromJson(Map<String, dynamic> json) =>
      _$ImperialFromJson(json);
}

@freezed
class Temperature with _$Temperature {
  const factory Temperature({
    final Metric? metric,
    final Imperial? imperial,
  }) = _Temperature;

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}

@freezed
class WeatherBar with _$WeatherBar {
  const factory WeatherBar({
    final String? localObservationDateTime,
    final int? epochTime,
    final String? weatherText,
    final int? weatherIcon,
    final bool? hasPrecipitation,
    final dynamic precipitationType,
    final bool? isDayTime,
    final Temperature? temperature,
    final String? mobileLink,
    final String? link,
  }) = _WeatherBar;

  factory WeatherBar.fromJson(Map<String, dynamic> json) =>
      _$WeatherBarFromJson(json);
}
