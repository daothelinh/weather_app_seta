import 'dart:convert';

import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/common/local_data/app_local_key.dart';
import 'package:base_bloc_3/common/local_data/index.dart';
import 'package:base_bloc_3/features/weather/domain/use_case/weather_use_case.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/base_widget.dart';
import '../../domain/entity/index.dart';

part 'weather_bloc.freezed.dart';
part 'weather_bloc.g.dart';
part 'weather_state.dart';
part 'weather_event.dart';

@injectable
class WeatherBloc extends BaseBloc<WeatherEvent, WeatherState> {
  WeatherBloc(this._useCase) : super(WeatherState.init()) {
    on<WeatherEvent>((WeatherEvent event, Emitter<WeatherState> emit) async {
      await event.when(
        init: () => onInit(emit),
        searching: (String text) => onSearching(emit, text),
        chooseCity: (String text) => chooseCity(emit, text),
        showOverlay: () => onShowOverlay(emit),
      );
    });
  }
  late bool isSearching = false;
  late String a = 'hah';
  late List<String> list = ['a', 'b', 'c', 'd', 'e', 'f'];
  late List<String> list2 = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
  late List<LocalStorage> listLocal;
  late TextEditingController controller = TextEditingController();

  final WeatherUseCase _useCase;
  Future onInit(Emitter<WeatherState> emit) async {
    controller.selection = TextSelection(
        baseOffset: controller.text.length,
        extentOffset: controller.text.length);
    // emit(state.copyWith());
    print('haha');
  }

  Future onShowOverlay(Emitter<WeatherState> emit) async {
    emit(state.copyWith(listSearch: list));
  }

  Future onSearching(Emitter<WeatherState> emit, String text) async {
    if (text.isNotEmpty) {
      final res = await _useCase.getCity(offset: 1, q: text.toString());

      // emit(state.copyWith(listSearch: list));
      res.fold(
        (l) => print(res.length()),
        (r) => print('done'),
      );
    }
    //Call API

    print(text + ' searching call api');
  }

  void checkSelection(String text) async {
    controller.text = text;
    controller.selection = TextSelection(
        baseOffset: controller.text.length,
        extentOffset: controller.text.length);
  }

  Future chooseCity(Emitter<WeatherState> emit, String text) async {
    checkSelection(text);
    localPref.save(AppLocalKey.search, controller.text);
    emit(state.copyWith(
      isSearching: false,
      listSearch: list,
    ));
    onSearching(emit, text);
    // localPref.get<String>(AppLocalKey.search);
  }
}
