import 'package:digiations_nexa/core/route/routes_generator.dart';
import 'package:digiations_nexa/core/widgets/background.dart' show BackgroundScreen;
import 'package:flutter/material.dart';



Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesGenerator.onGenerateRoutes,
      builder: (context, child) {
        return BackgroundScreen(
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}
