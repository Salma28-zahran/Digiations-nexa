
import 'package:digiations_nexa/core/route/routes.dart';
import 'package:digiations_nexa/core/widgets/background.dart';
import 'package:digiations_nexa/features/auth/login/presentation/views/department.dart';
import 'package:digiations_nexa/features/auth/login/presentation/views/position.dart';
import 'package:digiations_nexa/features/auth/login/presentation/views/login_screen.dart';

import 'package:digiations_nexa/features/auth/register/presentation/views/register_screen.dart';
import 'package:digiations_nexa/features/employee_tasks/presentation/views/employee_tasks.dart';
import 'package:digiations_nexa/features/home_employee/presentation/views/home_employee.dart';
import 'package:digiations_nexa/features/home_manager/presentation/views/home_manger.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.position:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child:Position() ,
          ),
          settings: settings,
        );
      case PageRouteName.department:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: Department() ,
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
      case PageRouteName.homeEmployee:
        return MaterialPageRoute(
          builder: (context) => BackgroundScreen(
            child: HomeEmployee(),
          ),
          settings: settings,
        );
      case PageRouteName.homeManager:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: HomeManger(),
          ),
          settings: settings,
        );
      case PageRouteName.EmployeeTasks:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: EmployeeTasks(),
          ),
          settings: settings,
        );




      default:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: Position(),
          ),
          settings: settings,
        );
    }
  }
}
