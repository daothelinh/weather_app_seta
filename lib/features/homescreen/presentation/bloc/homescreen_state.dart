part of 'homescreen_bloc.dart';

@CopyWith()
class HomeScreenState extends BaseBlocState {
  final List<WeatherBarEntity>? weatherbars;
  final List<WeatherBar>? weather;
  HomeScreenState(
      {this.weatherbars, required super.status, super.message, this.weather});

  factory HomeScreenState.init() {
    return HomeScreenState(status: BaseStateStatus.init);
  }

  @override
  List get props => [status, message, weatherbars, weather];
}
