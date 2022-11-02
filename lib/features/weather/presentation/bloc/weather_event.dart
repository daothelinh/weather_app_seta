part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.init() = Init;
  const factory WeatherEvent.searching(String text) = Searching;
  const factory WeatherEvent.chooseCity(String text, CityEntity city) =
      ChooseCity;
  const factory WeatherEvent.showOverlay() = ShowOverlay;
  const factory WeatherEvent.getArea(String key) = GetArea;
  const factory WeatherEvent.hideOverlay() = HideOverlay;
}
