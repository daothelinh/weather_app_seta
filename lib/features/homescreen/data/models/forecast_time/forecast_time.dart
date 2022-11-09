import 'package:freezed_annotation/freezed_annotation.dart';
part 'forecast_time.freezed.dart';
part 'forecast_time.g.dart';

@freezed
class Headline with _$Headline {
  const factory Headline({
    @JsonKey(name: "EffectiveDate") final String? effectiveDate,
    @JsonKey(name: "EffectiveEpochDate") final int? effectiveEpochDate,
    @JsonKey(name: "Severity") final int? severity,
    @JsonKey(name: "Text") final String? text,
    @JsonKey(name: "Category") final String? category,
    @JsonKey(name: "EndDate") final String? endDate,
    @JsonKey(name: "EndEpochDate") final int? endEpochDate,
    @JsonKey(name: "MobileLink") final String? mobileLink,
    @JsonKey(name: "Link") final String? link,
  }) = _Headline;

  factory Headline.fromJson(Map<String, dynamic> json) =>
      _$HeadlineFromJson(json);
}

@freezed
class Minimum with _$Minimum {
  const factory Minimum({
    @JsonKey(name: "Value") final double? value,
    @JsonKey(name: "Unit") final String? unit,
    @JsonKey(name: "UnitType") final int? unitType,
  }) = _Minimum;

  factory Minimum.fromJson(Map<String, dynamic> json) =>
      _$MinimumFromJson(json);
}

@freezed
class Maximum with _$Maximum {
  const factory Maximum({
    @JsonKey(name: "Value") final double? value,
    @JsonKey(name: "Unit") final String? unit,
    @JsonKey(name: "UnitType") final int? unitType,
  }) = _Maximum;

  factory Maximum.fromJson(Map<String, dynamic> json) =>
      _$MaximumFromJson(json);
}

@freezed
class Temperature with _$Temperature {
  const factory Temperature({
    @JsonKey(name: "Minimum") final Minimum? minimum,
    @JsonKey(name: "Maximum") final Maximum? maximum,
  }) = _Temperature;

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}

@freezed
class Day with _$Day {
  const factory Day({
    @JsonKey(name: "Icon") final int? icon,
    @JsonKey(name: "IconPhrase") final String? iconPhrase,
    @JsonKey(name: "HasPrecipitation") final bool? hasPrecipitation,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

@freezed
class Night with _$Night {
  const factory Night({
    @JsonKey(name: "Icon") final int? icon,
    @JsonKey(name: "IconPhrase") final String? iconPhrase,
    @JsonKey(name: "HasPrecipitation") final bool? hasPrecipitation,
  }) = _Night;

  factory Night.fromJson(Map<String, dynamic> json) => _$NightFromJson(json);
}

@freezed
class DailyForecasts with _$DailyForecasts {
  const factory DailyForecasts({
    @JsonKey(name: "Date") final String? date,
    @JsonKey(name: "EpochDate") final int? epochDate,
    @JsonKey(name: "Temperature") final Temperature? temperature,
    @JsonKey(name: "Day") final Day? day,
    @JsonKey(name: "Night") final Night? night,
    @JsonKey(name: "Sources") final List<String>? sources,
    @JsonKey(name: "MobileLink") final String? mobileLink,
    @JsonKey(name: "Link") final String? link,
  }) = _DailyForecasts;

  factory DailyForecasts.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastsFromJson(json);
}

@freezed
class ForecastTime with _$ForecastTime {
  const factory ForecastTime({
    @JsonKey(name: "Headline") final Headline? headline,
    @JsonKey(name: "DailyForecasts") final List<DailyForecasts>? dailyForecasts,
  }) = _ForecastTime;

  factory ForecastTime.fromJson(Map<String, dynamic> json) =>
      _$ForecastTimeFromJson(json);
}
