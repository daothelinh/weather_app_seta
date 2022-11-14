part of 'weather_bloc.dart';

@CopyWith()
class WeatherState extends BaseBlocState {
  const WeatherState({
    required super.status,
    super.message,
    this.area,
    this.city,
  });
  final List<CityModel>? city;

  final List<Area>? area;

  factory WeatherState.init() =>
      const WeatherState(status: BaseStateStatus.init);
  @override
  List get props => [status, message, city, area];
}
