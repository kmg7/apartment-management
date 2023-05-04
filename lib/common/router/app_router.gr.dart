// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainView(),
      );
    },
    ResidentManagementRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ResidentManagementView(),
      );
    },
    ApartmentManagementRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ApartmentManagementView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MainRoute.name,
          path: '/',
        ),
        RouteConfig(
          ResidentManagementRoute.name,
          path: '/resident',
        ),
        RouteConfig(
          ApartmentManagementRoute.name,
          path: '/apartment',
        ),
      ];
}

/// generated route for
/// [MainView]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [ResidentManagementView]
class ResidentManagementRoute extends PageRouteInfo<void> {
  const ResidentManagementRoute()
      : super(
          ResidentManagementRoute.name,
          path: '/resident',
        );

  static const String name = 'ResidentManagementRoute';
}

/// generated route for
/// [ApartmentManagementView]
class ApartmentManagementRoute extends PageRouteInfo<void> {
  const ApartmentManagementRoute()
      : super(
          ApartmentManagementRoute.name,
          path: '/apartment',
        );

  static const String name = 'ApartmentManagementRoute';
}
