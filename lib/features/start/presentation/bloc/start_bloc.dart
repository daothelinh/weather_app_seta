import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/common/index.dart';
import 'package:base_bloc_3/features/example/domain/use_case/use_case.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/base_widget.dart';
import '../../../../base/network/errors/error.dart';
import '../../domain/entity/movie_entity.dart';

part 'start_bloc.freezed.dart';
part 'start_bloc.g.dart';
part 'start_event.dart';
part 'start_state.dart';

@injectable
class StartBloc extends BaseBloc<StartEvent, StartState> {
  StartBloc() : super(StartState.init()) {
    on<StartEvent>((StartEvent event, Emitter<StartState> emit) async {
      await event.when(
        init: (int index) => onInit(emit, index),
        onSearch: (String text) => onSearch(emit, text),
        changeSearch: () => onChangeSearch(emit),
      );
    });
  }

  late bool? isSearch = false;

  onInit(Emitter<StartState> emit, int index) async {
    if (index == 0) {
      //TODO: Call api 1
      print(0);
    } else {
      //TODO: Call api 2
      print(1);
    }
  }

  onSearch(Emitter<StartState> emit, String text) async {
    if (text != '') {
      //call api search with text
      print(text);
    }
  }

  onChangeSearch(Emitter<StartState> emit) async {
    isSearch = !isSearch!;

    emit(state.copyWith(isSearch: isSearch));
  }
}
