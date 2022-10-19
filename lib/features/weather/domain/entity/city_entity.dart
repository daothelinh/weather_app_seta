import '../../data/model/city_model.dart';

class CityEntity {
  String? id;
  CountryEntity? name;

  CityEntity({this.id, this.name});

  factory CityEntity.formModel(CityModel city) => CityEntity(
        id: city.key,
        name: city.country as CountryEntity,
      );
}

class CountryEntity {
  String? id;
  String? englistName;

  CountryEntity({this.id, this.englistName});

  factory CountryEntity.formModel(Country country) => CountryEntity(
        id: country.id,
        englistName: country.englishName,
      );
}
