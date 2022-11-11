import 'package:freezed_annotation/freezed_annotation.dart';
part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
class Region with _$Region {
  const factory Region({
    @JsonKey(name: 'Id') final String? id,
    @JsonKey(name: 'LocalizedName') final String? localizedName,
    @JsonKey(name: 'EnglishName') final String? englishName,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}

@freezed
class Country with _$Country {
  const factory Country({
    @JsonKey(name: 'Id') final String? id,
    @JsonKey(name: 'LocalizedName') final String? localizedName,
    @JsonKey(name: 'EnglishName') final String? englishName,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@freezed
class AdministrativeArea with _$AdministrativeArea {
  const factory AdministrativeArea({
    @JsonKey(name: 'Id') final String? id,
    @JsonKey(name: 'LocalizedName') final String? localizedName,
    @JsonKey(name: 'EnglishName') final String? englishName,
    @JsonKey(name: 'Level') final double? level,
    @JsonKey(name: 'LocalizedType') final String? localizedType,
    @JsonKey(name: 'EnglishType') final String? englishType,
    @JsonKey(name: 'CountryID') final String? countryID,
  }) = _AdministrativeArea;

  factory AdministrativeArea.fromJson(Map<String, dynamic> json) =>
      _$AdministrativeAreaFromJson(json);
}

@freezed
class TimeZone with _$TimeZone {
  const factory TimeZone({
    @JsonKey(name: 'Code') final String? code,
    @JsonKey(name: 'Name') final String? name,
    @JsonKey(name: 'GmtOffset') final double? gmtOffset,
    @JsonKey(name: 'IsDaylightSaving') final bool? isDaylightSaving,
    @JsonKey(name: 'NextOffsetChange') final String? nextOffsetChange,
  }) = _TimeZone;

  factory TimeZone.fromJson(Map<String, dynamic> json) =>
      _$TimeZoneFromJson(json);
}

@freezed
class Metric with _$Metric {
  const factory Metric({
    @JsonKey(name: 'Value') final double? value,
    @JsonKey(name: 'Unit') final String? unit,
    @JsonKey(name: 'UnitType') final double? unitType,
  }) = _Metric;

  factory Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);
}

@freezed
class Imperial with _$Imperial {
  const factory Imperial({
    @JsonKey(name: 'Value') final double? value,
    @JsonKey(name: 'Unit') final String? unit,
    @JsonKey(name: 'UnitType') final double? unitType,
  }) = _Imperial;

  factory Imperial.fromJson(Map<String, dynamic> json) =>
      _$ImperialFromJson(json);
}

@freezed
class Elevation with _$Elevation {
  const factory Elevation({
    @JsonKey(name: 'Metric') final Metric? metric,
    @JsonKey(name: 'Imperial') final Imperial? imperial,
  }) = _Elevation;

  factory Elevation.fromJson(Map<String, dynamic> json) =>
      _$ElevationFromJson(json);
}

@freezed
class GeoPosition with _$GeoPosition {
  const factory GeoPosition({
    @JsonKey(name: 'Latitude') final double? latitude,
    @JsonKey(name: 'Longitude') final double? longitude,
    @JsonKey(name: 'Elevation') final Elevation? elevation,
  }) = _GeoPosition;

  factory GeoPosition.fromJson(Map<String, dynamic> json) =>
      _$GeoPositionFromJson(json);
}

@freezed
class CityModel with _$CityModel {
  const factory CityModel({
    @JsonKey(name: 'Version') final double? version,
    @JsonKey(name: 'Key') final String? key,
    @JsonKey(name: 'Type') final String? type,
    @JsonKey(name: 'Rank') final double? rank,
    @JsonKey(name: 'LocalizedName') final String? localizedName,
    @JsonKey(name: 'EnglishName') final String? englishName,
    @JsonKey(name: 'PrimaryPostalCode') final String? primaryPostalCode,
    @JsonKey(name: 'Region') final Region? region,
    @JsonKey(name: 'Country') final Country? country,
    @JsonKey(name: 'AdministrativeArea')
        final AdministrativeArea? administrativeArea,
    @JsonKey(name: 'TimeZone') final TimeZone? timeZone,
    @JsonKey(name: 'GeoPosition') final GeoPosition? geoPosition,
    @JsonKey(name: 'IsAlias') final bool? isAlias,
    @JsonKey(name: 'SupplementalAdminAreas')
        final List<dynamic>? supplementalAdminAreas,
    @JsonKey(name: 'DataSets') final List<String>? dataSets,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
