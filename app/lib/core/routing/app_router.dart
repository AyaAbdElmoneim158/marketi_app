import 'package:app/core/common/screen/under_maintenance_screen.dart';
import 'package:app/core/routing/app_routes.dart';
import 'package:app/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic>? onGenerateRoute(RouteSettings setting) {
    // final arguments = setting.arguments;
    switch (setting.name) {
      case AppRoutes.homeRouter:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      default:
        return MaterialPageRoute(builder: (context) => UnderMaintenanceScreen());
    }
  }
}
