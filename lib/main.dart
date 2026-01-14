import 'package:digiations_nexa/core/route/routes_generator.dart';
import 'package:digiations_nexa/core/widgets/background.dart';
import 'package:flutter/material.dart';

final ValueNotifier<ThemeMode> themeNotifier =
ValueNotifier(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: mode,

          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.transparent,
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.transparent,
          ),

          onGenerateRoute: RoutesGenerator.onGenerateRoutes,

          builder: (context, child) {
            return BackgroundScreen(
              child: child ?? const SizedBox(),
            );
          },
        );
      },
    );
  }
}
