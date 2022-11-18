import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/common/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'core_bloc.freezed.dart';
part 'core_bloc.g.dart';
part 'core_event.dart';
part 'core_state.dart';

@injectable
class CoreBloc extends BaseBloc<CoreEvent, CoreState> {
  CoreBloc() : super(CoreState.init()) {
    on<CoreEvent>((CoreEvent event, Emitter<CoreState> emit) async {
      await event.when(
        init: () => onInit(emit),
        changeIndex: (int i) => onChangeIndex(emit, i),
        changeIndexHome: (int i) => onChangeIndexHome(emit, i),
        deleteArea: (int i) => onDeleteArea(emit, i),
        addArea: () => onAddArea(emit),
      );
    });
  }
  late List<String> _listLocationKey;
  onInit(Emitter<CoreState> emit) async {
    _listLocationKey = List<String>.from(
        await localPref.get(AppLocalKey.listLocationKey) ?? ['0']);
    emit(state.copyWith(
        index: 1, indexHome: 0, listLocationKey: _listLocationKey));
  }

  onChangeIndex(Emitter<CoreState> emit, int i) async {
    emit(state.copyWith(index: i));
  }

  onChangeIndexHome(Emitter<CoreState> emit, int i) async {
    emit(state.copyWith(indexHome: i));
  }

  onDeleteArea(Emitter<CoreState> emit, int i) async {
    _listLocationKey.removeAt(i);
    emit(state.copyWith(listLocationKey: _listLocationKey));
  }

  onAddArea(Emitter<CoreState> emit) async {
    _listLocationKey = List<String>.from(await localPref
        .get(AppLocalKey.listLocationKey)
        .then((value) => value));
    emit(state.copyWith(listLocationKey: _listLocationKey));
  }
}
