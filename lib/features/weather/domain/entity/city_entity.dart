import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/city_model.dart';

class CityEntity {
  final String? id;
  final CountryEntity? country;

  CityEntity(this.id, this.country);

  factory CityEntity.fromModel(CityModel model) {
    return CityEntity(
        model.key, CountryEntity(englishName: model.country?.englishName));
  }
}

class CountryEntity {
  final String? id;
  final String? englishName;

  CountryEntity({this.id, this.englishName});
}
