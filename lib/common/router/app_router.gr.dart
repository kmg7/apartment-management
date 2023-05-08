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
    ApartmentManagementRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ApartmentManagementView(),
      );
    },
    ResidentManagementRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ResidentManagementView(),
      );
    },
    ResidenceManagementRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ResidenceManagementView(),
      );
    },
    ApartmentDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ApartmentDetailRouteArgs>(
          orElse: () => const ApartmentDetailRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ApartmentDetailView(
          key: args.key,
          apartment: args.apartment,
        ),
      );
    },
    ResidentDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ResidentDetailRouteArgs>(
          orElse: () => const ResidentDetailRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ResidentDetailView(
          key: args.key,
          resident: args.resident,
        ),
      );
    },
    ResidenceDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ResidenceDetailRouteArgs>(
          orElse: () => const ResidenceDetailRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ResidenceDetailView(
          key: args.key,
          residence: args.residence,
        ),
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
          ApartmentManagementRoute.name,
          path: '/apartment',
        ),
        RouteConfig(
          ResidentManagementRoute.name,
          path: '/resident',
        ),
        RouteConfig(
          ResidenceManagementRoute.name,
          path: '/residence',
        ),
        RouteConfig(
          ApartmentDetailRoute.name,
          path: '/apartmentDetails',
        ),
        RouteConfig(
          ResidentDetailRoute.name,
          path: '/residentDetails',
        ),
        RouteConfig(
          ResidenceDetailRoute.name,
          path: '/residenceDetail',
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
/// [ApartmentManagementView]
class ApartmentManagementRoute extends PageRouteInfo<void> {
  const ApartmentManagementRoute()
      : super(
          ApartmentManagementRoute.name,
          path: '/apartment',
        );

  static const String name = 'ApartmentManagementRoute';
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
/// [ResidenceManagementView]
class ResidenceManagementRoute extends PageRouteInfo<void> {
  const ResidenceManagementRoute()
      : super(
          ResidenceManagementRoute.name,
          path: '/residence',
        );

  static const String name = 'ResidenceManagementRoute';
}

/// generated route for
/// [ApartmentDetailView]
class ApartmentDetailRoute extends PageRouteInfo<ApartmentDetailRouteArgs> {
  ApartmentDetailRoute({
    Key? key,
    Apartment? apartment,
  }) : super(
          ApartmentDetailRoute.name,
          path: '/apartmentDetails',
          args: ApartmentDetailRouteArgs(
            key: key,
            apartment: apartment,
          ),
        );

  static const String name = 'ApartmentDetailRoute';
}

class ApartmentDetailRouteArgs {
  const ApartmentDetailRouteArgs({
    this.key,
    this.apartment,
  });

  final Key? key;

  final Apartment? apartment;

  @override
  String toString() {
    return 'ApartmentDetailRouteArgs{key: $key, apartment: $apartment}';
  }
}

/// generated route for
/// [ResidentDetailView]
class ResidentDetailRoute extends PageRouteInfo<ResidentDetailRouteArgs> {
  ResidentDetailRoute({
    Key? key,
    Resident? resident,
  }) : super(
          ResidentDetailRoute.name,
          path: '/residentDetails',
          args: ResidentDetailRouteArgs(
            key: key,
            resident: resident,
          ),
        );

  static const String name = 'ResidentDetailRoute';
}

class ResidentDetailRouteArgs {
  const ResidentDetailRouteArgs({
    this.key,
    this.resident,
  });

  final Key? key;

  final Resident? resident;

  @override
  String toString() {
    return 'ResidentDetailRouteArgs{key: $key, resident: $resident}';
  }
}

/// generated route for
/// [ResidenceDetailView]
class ResidenceDetailRoute extends PageRouteInfo<ResidenceDetailRouteArgs> {
  ResidenceDetailRoute({
    Key? key,
    Residence? residence,
  }) : super(
          ResidenceDetailRoute.name,
          path: '/residenceDetail',
          args: ResidenceDetailRouteArgs(
            key: key,
            residence: residence,
          ),
        );

  static const String name = 'ResidenceDetailRoute';
}

class ResidenceDetailRouteArgs {
  const ResidenceDetailRouteArgs({
    this.key,
    this.residence,
  });

  final Key? key;

  final Residence? residence;

  @override
  String toString() {
    return 'ResidenceDetailRouteArgs{key: $key, residence: $residence}';
  }
}
