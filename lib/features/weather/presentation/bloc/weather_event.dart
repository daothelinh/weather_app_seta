part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.init() = Init;
  const factory WeatherEvent.deleteCitySearch(int index) = DeleteCitySearch;
  const factory WeatherEvent.deleteArea(int index) = DeleteArea;
  const factory WeatherEvent.getSearchText(String text) = GetSearchText;
  const factory WeatherEvent.chooseCity(dynamic city) = ChooseCity;
}
