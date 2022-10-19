part of 'weather_bloc.dart';

@CopyWith()
class WeatherState extends BaseBlocState {
  WeatherState(
      {required super.status,
      super.message,
      this.isSearching,
      this.size,
      this.offset,
      this.localStorage,
      this.textController});
  bool? isSearching;
  String? textController;
  Size? size;
  Offset? offset;
  List<LocalStorage>? localStorage;
  factory WeatherState.init() {
    return WeatherState(status: BaseStateStatus.init);
  }

  @override
  List get props => [status, message, isSearching, size, offset];
}
