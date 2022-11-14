part of 'homescreen_bloc.dart';

@CopyWith()
class HomeScreenState extends BaseBlocState {
  final List<WeatherBarEntity>? weatherbars;
  final ForecastTimeEntity? forecastTime;
  final List<ForecastDateTimeEntity> forecastDateTimes;
  final ForecastDayEntity? forecastDay;
  final List<DailyForecastDayEntity> dailyForecastDay;

  final List<WeatherBar>? weather;
  const HomeScreenState({
    this.dailyForecastDay = const [],
    this.forecastDateTimes = const [],
    this.weatherbars,
    this.forecastDay,
    required super.status,
    super.message,
    this.weather,
    this.forecastTime,
  });

  factory HomeScreenState.init() {
    return const HomeScreenState(status: BaseStateStatus.init);
  }

  @override
  List get props => [
        status,
        message,
        weatherbars,
        weather,
        forecastTime,
        forecastDateTimes,
        forecastDay,
        dailyForecastDay
      ];
}
