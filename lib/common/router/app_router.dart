import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../model/apartment_model.dart';
import '../../model/residence_model.dart';
import '../../model/resident_model.dart';
import '../../view/apartment/apartment_detail_view.dart';
import '../../view/apartment/apartment_management_view.dart';
import '../../view/main_view.dart';
import '../../view/residence/residence_detail_view.dart';
import '../../view/residence/residence_management_view.dart';
import '../../view/resident/resident_detail_view.dart';
import '../../view/resident/resident_management_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainView, path: '/', initial: true),
    AutoRoute(page: ApartmentManagementView, path: '/apartment'),
    AutoRoute(page: ResidentManagementView, path: '/resident'),
    AutoRoute(page: ResidenceManagementView, path: '/residence'),
    AutoRoute(page: ApartmentDetailView, path: '/apartmentDetails'),
    AutoRoute(page: ResidentDetailView, path: '/residentDetails'),
    AutoRoute(page: ResidenceDetailView, path: '/residenceDetail'),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter();
}
