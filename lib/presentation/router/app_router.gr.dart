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
    SignInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignInPage());
    },
    RegisterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RegisterPage());
    },
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MainPage());
    },
    CreateEventRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CreateEventPage());
    },
    ManageTimelinesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ManageTimelinesPage());
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/main', fullMatch: true),
        RouteConfig(SignInRoute.name, path: '/login'),
        RouteConfig(RegisterRoute.name, path: '/register'),
        RouteConfig(MainRoute.name, path: '/main'),
        RouteConfig(CreateEventRoute.name, path: '/new-event'),
        RouteConfig(ManageTimelinesRoute.name, path: '/manage-timelines'),
        RouteConfig(SettingsRoute.name, path: '/settings')
      ];
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/login');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [CreateEventPage]
class CreateEventRoute extends PageRouteInfo<void> {
  const CreateEventRoute() : super(CreateEventRoute.name, path: '/new-event');

  static const String name = 'CreateEventRoute';
}

/// generated route for
/// [ManageTimelinesPage]
class ManageTimelinesRoute extends PageRouteInfo<void> {
  const ManageTimelinesRoute()
      : super(ManageTimelinesRoute.name, path: '/manage-timelines');

  static const String name = 'ManageTimelinesRoute';
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings');

  static const String name = 'SettingsRoute';
}
