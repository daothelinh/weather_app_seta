import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../features/core/presentation/pages/core_page.dart';
import '../features/weather/presentation/bloc/weather_bloc.dart';
import '../features/weather/presentation/pages/weather_page.dart';
import '../features/weather/presentation/pages/weather_page_dialog.dart';
import 'app_routes.dart';
part 'app_pages.gr.dart';

@singleton
@MaterialAutoRouter(routes: [
  AutoRoute(path: AppRoutes.initial, page: CorePage, initial: true),
  AutoRoute(path: AppRoutes.weather, page: WeatherPage),
  CupertinoRoute(
    path: AppRoutes.weather_dialog,
    page: WeatherPageDialog,
    fullscreenDialog: true,
  ),
])
class AppPages extends _$AppPages {}
