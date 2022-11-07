part of 'homescreen_bloc.dart';

@CopyWith()
class HomeScreenState extends BaseBlocState {
  final List<WeatherBarEntity>? weatherbars;
  final ForecastTimeEntity? forecastTime;

  final List<WeatherBar>? weather;
  HomeScreenState({
    this.weatherbars,
    required super.status,
    super.message,
    this.weather,
    this.forecastTime,
  });

  factory HomeScreenState.init() {
    return HomeScreenState(status: BaseStateStatus.init);
  }

  @override
  List get props => [status, message, weatherbars, weather, forecastTime];
}
