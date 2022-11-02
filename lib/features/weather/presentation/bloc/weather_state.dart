part of 'weather_bloc.dart';

@CopyWith()
class WeatherState extends BaseBlocState {
  WeatherState({
    required super.status,
    super.message,
    this.isSearching,
    this.listSearch,
    this.listCity,
    this.area,
  });
  bool? isSearching;
  AreaEntity? area;
  List<CityEntity>? listCity;
  List<String>? listSearch;
  factory WeatherState.init() {
    return WeatherState(status: BaseStateStatus.init);
  }

  @override
  List get props => [status, message, isSearching, listSearch];
}
