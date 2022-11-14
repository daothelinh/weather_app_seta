part of 'home_bloc.dart';

@CopyWith()
class HomeState extends BaseBlocState {
  const HomeState({required super.status, super.message, this.listLocationKey});
  final List<String>? listLocationKey;

  factory HomeState.init() => const HomeState(status: BaseStateStatus.init);
  @override
  List get props => [status, message, listLocationKey];
}
