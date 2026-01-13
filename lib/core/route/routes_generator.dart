
import 'package:digiations_nexa/core/route/routes.dart';
import 'package:digiations_nexa/core/widgets/background.dart';
import 'package:digiations_nexa/features/auth/login/presentation/views/department.dart';
import 'package:digiations_nexa/features/auth/login/presentation/views/login_screen.dart';
import 'package:digiations_nexa/features/auth/register/presentation/views/register_screen.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.department:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: Department(),
          ),
          settings: settings,
        );
      case PageRouteName.login:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: LoginScreen(),
          ),
          settings: settings,
        );
      case PageRouteName.register:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: RegisterScreen(),
          ),
          settings: settings,
        );



      default:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: Department(),
          ),
          settings: settings,
        );
    }
  }
}
