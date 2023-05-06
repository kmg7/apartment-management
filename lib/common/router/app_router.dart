import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../model/apartment_model.dart';
import '../../view/apartment/apartment_detail_view.dart';
import '../../view/apartment/apartment_management_view.dart';
import '../../view/main_view.dart';
import '../../view/resident_management_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainView, path: '/', initial: true),
    AutoRoute(page: ResidentManagementView, path: '/resident'),
    AutoRoute(page: ApartmentManagementView, path: '/apartment'),
    AutoRoute(page: ApartmentDetailView, path: '/apartmentDetails')
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter();
}
