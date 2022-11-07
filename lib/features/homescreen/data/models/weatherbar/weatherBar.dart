import 'package:freezed_annotation/freezed_annotation.dart';
part 'weatherBar.freezed.dart';
part 'weatherBar.g.dart';

@freezed
class Metric with _$Metric {
  const factory Metric({
    @JsonKey(name: "Value") final double? value,
    @JsonKey(name: "Unit") final String? unit,
    @JsonKey(name: "UnitType") final int? unitType,
  }) = _Metric;

  factory Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);
}

@freezed
class Imperial with _$Imperial {
  const factory Imperial({
    @JsonKey(name: "Value") final double? value,
    @JsonKey(name: "Unit") final String? unit,
    @JsonKey(name: "UnitType") final int? unitType,
  }) = _Imperial;

  factory Imperial.fromJson(Map<String, dynamic> json) =>
      _$ImperialFromJson(json);
}

@freezed
class Temperature with _$Temperature {
  const factory Temperature({
    @JsonKey(name: "Metric") final Metric? metric,
    @JsonKey(name: "Imperial") final Imperial? imperial,
  }) = _Temperature;

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}

@freezed
class WeatherBar with _$WeatherBar {
  const factory WeatherBar({
    @JsonKey(name: "LocalObservationDateTime")
        final String? localObservationDateTime,
    @JsonKey(name: "EpochTime") final int? epochTime,
    @JsonKey(name: "WeatherText") final String? weatherText,
    @JsonKey(name: "WeatherIcon") final int? weatherIcon,
    @JsonKey(name: "HasPrecipitation") final bool? hasPrecipitation,
    @JsonKey(name: "PrecipitationType") final dynamic precipitationType,
    @JsonKey(name: "IsDayTime") final bool? isDayTime,
    @JsonKey(name: "Temperature") final Temperature? temperature,
    @JsonKey(name: "MobileLink") final String? mobileLink,
    @JsonKey(name: "Link") final String? link,
  }) = _WeatherBar;

  factory WeatherBar.fromJson(Map<String, dynamic> json) =>
      _$WeatherBarFromJson(json);
}
