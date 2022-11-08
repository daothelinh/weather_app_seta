part of 'homescreen_bloc.dart';

@CopyWith()
class HomeScreenState extends BaseBlocState {
  final List<WeatherBarEntity>? weatherbars;
  final ForecastTimeEntity? forecastTime;

  final List<WeatherBar>? weather;
  const HomeScreenState({
    this.weatherbars,
    required super.status,
    super.message,
    this.weather,
    this.forecastTime,
  });

  factory HomeScreenState.init() {
    return const HomeScreenState(status: BaseStateStatus.init);
  }

  @override
  List get props => [status, message, weatherbars, weather, forecastTime];
}
