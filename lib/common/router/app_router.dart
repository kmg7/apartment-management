import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../view/apartment_management_view.dart';
import '../../view/main_view.dart';
import '../../view/resident_management_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainView, path: '/', initial: true),
    AutoRoute(page: ResidentManagementView, path: '/resident'),
    AutoRoute(page: ApartmentManagementView, path: '/apartment')
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter();
}
