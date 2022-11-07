import 'package:freezed_annotation/freezed_annotation.dart';
part 'forecast_time.freezed.dart';
part 'forecast_time.g.dart';

@freezed
class Headline with _$Headline {
  const factory Headline({
    final String? effectiveDate,
    final int? effectiveEpochDate,
    final int? severity,
    final String? text,
    final String? category,
    final String? endDate,
    final int? endEpochDate,
    final String? mobileLink,
    final String? link,
  }) = _Headline;

  factory Headline.fromJson(Map<String, dynamic> json) =>
      _$HeadlineFromJson(json);
}

@freezed
class Minimum with _$Minimum {
  const factory Minimum({
    final int? value,
    final String? unit,
    final int? unitType,
  }) = _Minimum;

  factory Minimum.fromJson(Map<String, dynamic> json) =>
      _$MinimumFromJson(json);
}

@freezed
class Maximum with _$Maximum {
  const factory Maximum({
    final int? value,
    final String? unit,
    final int? unitType,
  }) = _Maximum;

  factory Maximum.fromJson(Map<String, dynamic> json) =>
      _$MaximumFromJson(json);
}

@freezed
class Temperature with _$Temperature {
  const factory Temperature({
    final Minimum? minimum,
    final Maximum? maximum,
  }) = _Temperature;

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}

@freezed
class Day with _$Day {
  const factory Day({
    final int? icon,
    final String? iconPhrase,
    final bool? hasPrecipitation,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

@freezed
class Night with _$Night {
  const factory Night({
    final int? icon,
    final String? iconPhrase,
    final bool? hasPrecipitation,
  }) = _Night;

  factory Night.fromJson(Map<String, dynamic> json) => _$NightFromJson(json);
}

@freezed
class DailyForecasts with _$DailyForecasts {
  const factory DailyForecasts({
    final String? date,
    final int? epochDate,
    final Temperature? temperature,
    final Day? day,
    final Night? night,
    final List<String>? sources,
    final String? mobileLink,
    final String? link,
  }) = _DailyForecasts;

  factory DailyForecasts.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastsFromJson(json);
}

@freezed
class ForecastTime with _$ForecastTime {
  const factory ForecastTime({
    final Headline? headline,
    final List<DailyForecasts>? dailyForecasts,
  }) = _ForecastTime;

  factory ForecastTime.fromJson(Map<String, dynamic> json) =>
      _$ForecastTimeFromJson(json);
}
