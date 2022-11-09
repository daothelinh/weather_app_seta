import 'package:freezed_annotation/freezed_annotation.dart';
part 'forecast_date_time.freezed.dart';
part 'forecast_date_time.g.dart';

@freezed
class Temperature with _$Temperature {
  const factory Temperature({
    @JsonKey(name: "Value") final double? value,
    @JsonKey(name: "Unit") final String? unit,
    @JsonKey(name: "UnitType") final int? unitType,
  }) = _Temperature;

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}

@freezed
class ForecastDateTime with _$ForecastDateTime {
  const factory ForecastDateTime({
    @JsonKey(name: "DateTime") final String? dateTime,
    @JsonKey(name: "EpochDateTime") final int? epochDateTime,
    @JsonKey(name: "WeatherIcon") final int? weatherIcon,
    @JsonKey(name: "IconPhrase") final String? iconPhrase,
    @JsonKey(name: "HasPrecipitation") final bool? hasPrecipitation,
    @JsonKey(name: "IsDaylight") final bool? isDaylight,
    @JsonKey(name: "Temperature") final Temperature? temperature,
    @JsonKey(name: "PrecipitationProbability")
        final int? precipitationProbability,
    @JsonKey(name: "MobileLink") final String? mobileLink,
    @JsonKey(name: "Link") final String? link,
  }) = _ForecastDateTime;

  factory ForecastDateTime.fromJson(Map<String, dynamic> json) =>
      _$ForecastDateTimeFromJson(json);
}
