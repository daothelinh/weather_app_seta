part of 'start_bloc.dart';

@CopyWith()
class StartState extends BaseBlocState {
  StartState({required super.status, super.message, this.isSearch});
  final bool? isSearch;
  //todo: state list movie

  factory StartState.init() => StartState(status: BaseStateStatus.init);

  @override
  List get props => [status, message, isSearch];
}
