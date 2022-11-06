import 'dart:convert';

import 'package:base_bloc_3/common/index.dart';
import 'package:base_bloc_3/common/local_data/shared_pref.dart';
import 'package:base_bloc_3/di/di_setup.dart';
import 'package:base_bloc_3/features/weather/domain/entity/index.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/weather/domain/entity/city_entity.dart';
import 'base_bloc_state.dart';

abstract class BaseBloc<E, S extends BaseBlocState> extends Bloc<E, S> {
  BaseBloc(super.initialState);
  final localPref = getIt<LocalStorage>();
  final eventBus = getIt<EventBus>();

  late List<String> listPrefSearchValue = [];

  saveListSearch(CityEntity city) async {
    listPrefSearchValue.add(jsonEncode(city));
    await localPref.save(AppLocalKey.search, listPrefSearchValue);
  }

  // final connectivity = Connectivity().onConnectivityChanged;
  Future<List<CityEntity>> getListPrefCity() async {
    var l = List<String>.from(
            await localPref.get(AppLocalKey.search).then((value) => value))
        .map((e) => CityEntity.fromJson(jsonDecode((e))))
        .toList();
    return l;
  }

  getNumberOfPrefCity() async {
    var l = List<String>.from(
            await localPref.get(AppLocalKey.search).then((value) => value))
        .map((e) => CityEntity.fromJson(jsonDecode((e))))
        .toList();
    return l.length;
  }
}
