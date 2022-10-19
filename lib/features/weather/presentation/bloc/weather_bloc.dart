import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/common/local_data/app_local_key.dart';
import 'package:base_bloc_3/common/local_data/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/base_widget.dart';

part 'weather_bloc.freezed.dart';
part 'weather_bloc.g.dart';
part 'weather_state.dart';
part 'weather_event.dart';

// @injectable
// class WeatherBloc extends BaseBloc<WeatherEvent, WeatherState> {
//   WeatherBloc() : super(WeatherState.init()) {
//     // on<WeatherEvent>((WeatherEvent event, Emitter<WeatherState> emit) async {
//     //   // await event.when();
//     // });
//   }
// }

@injectable
class WeatherBloc extends BaseBloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState.init()) {
    on<WeatherEvent>((WeatherEvent event, Emitter<WeatherState> emit) async {
      await event.when(
        init: () => onInit(emit),
        searching: (String text) => onSearching(emit, text),
        chooseCity: (String text) => chooseCity(emit, text),
      );
    });
  }
  late bool isSearching = false;
  late String a = 'hah';
  late List<String> listSearch;
  late List<String> l = ['a', 'b', 'c', 'd', 'e', 'f'];
  late List<LocalStorage> listLocal;
  late TextEditingController controller = TextEditingController();
  Future onInit(Emitter<WeatherState> emit) async {
    emit(state.copyWith());
    print('haha');
  }

  Future onSearching(Emitter<WeatherState> emit, String text) async {
    listSearch[0] = localPref.get(AppLocalKey.search) as String;
    // print(listSearch[0]);
    emit(state.copyWith(isSearching: true));
  }

  Future chooseCity(Emitter<WeatherState> emit, String text) async {
    controller.text = text;
    // localPref.save(AppLocalKey.search, controller.text);
    emit(state.copyWith(
      isSearching: false,
    ));
    print(controller.text + 'bloc');
  }
}
