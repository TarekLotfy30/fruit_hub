import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routing/app_router.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theming/themes/app_theme.dart';

class FruitApp extends StatelessWidget {
  const FruitApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}