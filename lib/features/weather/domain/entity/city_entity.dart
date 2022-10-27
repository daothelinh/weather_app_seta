import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/city_model.dart';

class CityEntity {
  final String? id;
  final CountryEntity? country;

  CityEntity({this.id, this.country});

  factory CityEntity.fromModel(CityModel model) {
    return CityEntity(
      id: model.key,
      // country: CountryEntity(
      //   id: model.country?.id,
      //   englishName: model.country?.englishName,
      // ),
      country: CountryEntity.fromModel(model.country!),
    );
  }
}

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
}
