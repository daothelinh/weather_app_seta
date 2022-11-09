part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.init() = Init;
  const factory WeatherEvent.getFormSearch() = GetFormSearch;
  const factory WeatherEvent.getSearchText(String text) = GetSearchText;
  const factory WeatherEvent.chooseCity(String idCity) = ChooseCity;
}
