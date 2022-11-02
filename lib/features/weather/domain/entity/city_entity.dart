import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/city_model.dart';
part 'city_entity.g.dart';

@JsonSerializable()
class CityEntity {
  final String? id;
  final String? englishName;
  final CountryEntity? country;

  CityEntity({this.id, this.country, this.englishName});

  factory CityEntity.fromModel(CityModel model) {
    return CityEntity(
      id: model.key,
      // country: CountryEntity(
      //   id: model.country?.id,
      //   englishName: model.country?.englishName,
      // ),
      country: CountryEntity.fromModel(model.country!),
      englishName: model.englishName,
    );
  }

  //  CityEntity.fromJson(Map<String, dynamic> json)
  //     : id = json['Id'],
  //       englishName = json['EnglishName'],
  //       country = json['Country'];

  // Map<String, dynamic> toJson() {
  //   return {
  //     'Id': id,
  //     'EnglishName': englishName,
  //     'Country': country,
  //   };
  // }
  factory CityEntity.fromJson(Map<String, dynamic> json) =>
      _$CityEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CityEntityToJson(this);
}

@JsonSerializable()
class CountryEntity {
  final String? id;
  final String? englishName;

  CountryEntity({this.id, this.englishName});
  factory CountryEntity.fromModel(Country country) {
    return CountryEntity(
      id: country.id,
      englishName: country.englishName,
    );
  }

  factory CountryEntity.fromJson(Map<String, dynamic> json) =>
      _$CountryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CountryEntityToJson(this);
}
