part of 'weather_bloc.dart';

@CopyWith()
class WeatherState extends BaseBlocState {
  WeatherState({
    required super.status,
    super.message,
    this.isSearching,
    this.size,
    this.offset,
    this.localStorage,
    this.textController,
    this.listSearch,
    this.listCity,
  });
  bool? isSearching;
  List<CityEntity>? listCity;
  String? textController;
  Size? size;
  Offset? offset;
  List<LocalStorage>? localStorage;
  List<String>? listSearch;
  factory WeatherState.init() {
    return WeatherState(status: BaseStateStatus.init);
  }

  @override
  List get props => [status, message, isSearching, size, offset, listSearch];
}
