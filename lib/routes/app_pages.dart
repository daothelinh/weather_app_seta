import 'package:auto_route/auto_route.dart';
import 'package:base_bloc_3/features/home/presentation/pages/home_page.dart';
import 'package:base_bloc_3/features/weather/presentation/pages/weather_page.dart';
import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

import '../features/core/presentation/pages/core_page.dart';
import 'app_routes.dart';

part 'app_pages.gr.dart';

@singleton
@MaterialAutoRouter(routes: [
  AutoRoute(path: AppRoutes.initial, page: CorePage, initial: true),
  AutoRoute(path: AppRoutes.home, page: HomePage),
  AutoRoute(path: AppRoutes.weather, page: WeatherPage),
])
class AppPages extends _$AppPages {}
