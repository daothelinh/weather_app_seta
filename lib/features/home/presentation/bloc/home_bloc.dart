import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/common/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_bloc.g.dart';
part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.init()) {
    on<HomeEvent>((HomeEvent event, Emitter<HomeState> emit) async {
      await event.when(
        init: () => onInit(emit),
        deteleIndexArea: (int index) => onDeleteIndexArea(emit, index),
      );
    });
  }
  late List<String> listLocationKey;

  onInit(Emitter<HomeState> emit) async {
    listLocationKey = List<String>.from(
        await localPref.get(AppLocalKey.listLocationKey) ?? ['0']);
    emit(state.copyWith(listLocationKey: listLocationKey));
  }

  onDeleteIndexArea(Emitter<HomeState> emit, int index) async {
    listLocationKey.removeAt(index);
    emit(state.copyWith(listLocationKey: listLocationKey));
  }
}
