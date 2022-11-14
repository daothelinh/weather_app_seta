part of 'weather_bloc.dart';

@CopyWith()
class WeatherState extends BaseBlocState {
  WeatherState({
    required super.status,
    super.message,
    this.area,
    this.city,
  });
  final List<CityModel>? city;

  final List<Area>? area;

  factory WeatherState.init() => WeatherState(status: BaseStateStatus.init);
  @override
  List get props => [status, message, city, area];
}
