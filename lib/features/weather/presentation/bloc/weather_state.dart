part of 'weather_bloc.dart';

@CopyWith()
class WeatherState extends BaseBlocState {
  WeatherState({required super.status, super.message, this.area});
  final List<AreaModel>? area;

  factory WeatherState.init() => WeatherState(status: BaseStateStatus.init);
  @override
  List get props => [status, message, area];
}
