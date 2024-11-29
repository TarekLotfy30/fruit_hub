import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/observer.dart';
import 'package:fruit_hub/core/routing/app_router.dart';
import 'package:fruit_hub/core/theming/colors/app_colors.dart';
import 'package:fruit_hub/fruit_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.primaryColor, // navigation bar color
      statusBarColor: AppColors.primaryColor, // status bar color
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(FruitApp(appRouter: AppRouter())),
  );
}
