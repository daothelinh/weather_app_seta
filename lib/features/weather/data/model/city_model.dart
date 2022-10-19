import 'package:freezed_annotation/freezed_annotation.dart';
part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
class Region with _$Region {
  const factory Region({
    final String? id,
    final String? localizedName,
    final String? englishName,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}

@freezed
class Country with _$Country {
  const factory Country({
    final String? id,
    final String? localizedName,
    final String? englishName,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@freezed
class AdministrativeArea with _$AdministrativeArea {
  const factory AdministrativeArea({
    final String? id,
    final String? localizedName,
    final String? englishName,
    final int? level,
    final String? localizedType,
    final String? englishType,
    final String? countryID,
  }) = _AdministrativeArea;

  factory AdministrativeArea.fromJson(Map<String, dynamic> json) =>
      _$AdministrativeAreaFromJson(json);
}

@freezed
class TimeZone with _$TimeZone {
  const factory TimeZone({
    final String? code,
    final String? name,
    final int? gmtOffset,
    final bool? isDaylightSaving,
    final dynamic nextOffsetChange,
  }) = _TimeZone;

  factory TimeZone.fromJson(Map<String, dynamic> json) =>
      _$TimeZoneFromJson(json);
}

@freezed
class Metric with _$Metric {
  const factory Metric({
    final int? value,
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
class Elevation with _$Elevation {
  const factory Elevation({
    final Metric? metric,
    final Imperial? imperial,
  }) = _Elevation;

  factory Elevation.fromJson(Map<String, dynamic> json) =>
      _$ElevationFromJson(json);
}

@freezed
class GeoPosition with _$GeoPosition {
  const factory GeoPosition({
    final double? latitude,
    final double? longitude,
    final Elevation? elevation,
  }) = _GeoPosition;

  factory GeoPosition.fromJson(Map<String, dynamic> json) =>
      _$GeoPositionFromJson(json);
}

@freezed
class CityModel with _$CityModel {
  const factory CityModel({
    final int? version,
    final String? key,
    final String? type,
    final int? rank,
    final String? localizedName,
    final String? englishName,
    final String? primaryPostalCode,
    final Region? region,
    final Country? country,
    final AdministrativeArea? administrativeArea,
    final TimeZone? timeZone,
    final GeoPosition? geoPosition,
    final bool? isAlias,
    final List<dynamic>? supplementalAdminAreas,
    final List<String>? dataSets,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
