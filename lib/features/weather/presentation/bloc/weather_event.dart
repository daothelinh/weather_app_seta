part of 'weather_bloc.dart';

// @freezed
// class WeatherEvent with _$WeatherEvent {
//   const factory WeatherEvent.init() = Init;
//   const factory WeatherEvent.searching(String text) = Searching;
// }

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.init() = Init;
  const factory WeatherEvent.searching(String text) = Searching;
  const factory WeatherEvent.chooseCity(String text) = ChooseCity;
}
