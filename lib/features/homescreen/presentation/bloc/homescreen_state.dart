part of 'homescreen_bloc.dart';

@CopyWith()
class HomeScreenState extends BaseBlocState {
  final List<WeatherBarEntity> weatherbars;
  const HomeScreenState(
      {this.weatherbars = const [], required super.status, super.message});

  factory HomeScreenState.init() {
    return const HomeScreenState(status: BaseStateStatus.init);
  }

  @override
  List get props => [status, message, weatherbars];
}
