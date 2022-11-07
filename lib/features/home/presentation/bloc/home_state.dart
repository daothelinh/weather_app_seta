part of 'home_bloc.dart';

@CopyWith()
class HomeState extends BaseBlocState {
  HomeState({required super.status, super.message});

  factory HomeState.init() => HomeState(status: BaseStateStatus.init);
  @override
  List get props => [status, message];
}
