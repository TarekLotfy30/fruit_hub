import 'dart:developer';

import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

extension AppContextExtensions on BuildContext {
  // ==========================================
  // 1. SCREEN SIZE & RESPONSIVENESS UTILS
  // ==========================================

  /// جلب الحجم الكامل للشاشة بأفضل أداء (طريقة حديثة تمنع الـ Rebuild العشوائي)
  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  /// توحيد الـ Breakpoints بناءً على معايير فلاتر القياسية
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;

  /// جلب نوع الجهاز كـ Enum لو محتاج تعمل Conditional UI معقد
  DeviceType get deviceType {
    if (isDesktop) {
      return DeviceType.desktop;
    }
    if (isTablet) {
      return DeviceType.tablet;
    }
    return DeviceType.mobile;
  }

  void logScreenSize() {
    log(
      'Width: ${screenWidth.toStringAsFixed(1)} | '
      'Height: ${screenHeight.toStringAsFixed(1)} | '
      'Type: ${deviceType.name.toUpperCase()}',
    );
  }

  // ==========================================
  // 2. THEME & COLORS UTILS (بدون تكرار)
  // ==========================================

  ThemeData get appTheme => Theme.of(this);
  ColorScheme get colorScheme => appTheme.colorScheme;
  TextTheme get textTheme => appTheme.textTheme;

  // ألوان سريعة الاستخدام مباشرة من الـ ColorScheme والـ Theme
  Color get primaryColor => appTheme.primaryColor;
  Color get primaryColorDark => appTheme.primaryColorDark;
  Color get primaryColorLight => appTheme.primaryColorLight;

  Color get primary => colorScheme.primary;
  Color get onPrimary => colorScheme.onPrimary;
  Color get secondary => colorScheme.secondary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get cardColor => appTheme.cardColor;
  Color get errorColor => colorScheme.error;

  // ==========================================
  // 3. TYPOGRAPHY & TEXT STYLES
  // ==========================================

  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;
  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodySmall => textTheme.bodySmall;

  TextStyle? get titleTextStyle => appTheme.appBarTheme.titleTextStyle;

  /// ستايل مخصص مش موجود في الثيم الأساسي (تم تحسينه ليعتمد على الـ bodySmall الحالي)
  TextStyle? get bodyExtraSmall =>
      bodySmall?.copyWith(fontSize: 10, height: 1.6, letterSpacing: .5);

  // ==========================================
  // 4. ORIENTATION & BRIGHTNESS
  // ==========================================

  Orientation get orientation => MediaQuery.orientationOf(this);
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;

  bool get isDarkMode => appTheme.brightness == Brightness.dark;
  bool get isLightMode => appTheme.brightness == Brightness.light;
}



// Extension usage
// final theme = context.apptheme;
// final primaryColor = theme.primaryColor;
// final accentColor = theme.accentColor;
// final textTheme = theme.textTheme;


/// Usage : 

/* class ExperimentOfContext extends StatelessWidget {
  const ExperimentOfContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experiment Of Context', style: context.titleTextStyle),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('displayMedium', style: context.displayMedium),
              Text('displaySmall', style: context.displaySmall),
              Text('headlineLarge', style: context.headlineLarge),
              Text('headlineMedium', style: context.headlineMedium),
              Text('titleLarge', style: context.titleLarge),
              Text('titleMedium', style: context.titleMedium),
              Text('titleSmall', style: context.titleSmall),
              Text('labelLarge', style: context.labelLarge),
              Text('bodySmall', style: context.bodySmall),
              Text('titleTextStyle', style: context.titleTextStyle),
              Text('bodyExtraSmall', style: context.bodyExtraSmall),
              Text('bodyLarge', style: context.bodyLarge),
              Text('dividerTextSmall', style: context.dividerTextSmall),
              Text('dividerTextLarge', style: context.dividerTextLarge),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () => context.showToast('Toast'),
                child: const Text('Toast'),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () => context.showSnackBar('SnackBar'),
                child: const Text('Show snack bar'),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () => context.showBottomSheet(const Padding(padding: EdgeInsets.all(16.0), child: Text('Bottom Sheet'))),
                child: const Text('Bottom Sheet'),
              ),
              const SizedBox(height: 8.0),
              Text('width: ${context.width}'),
              Text('height: ${context.height}'),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
} */



// Widget build(BuildContext context) {
//      1. One line to log everything to the terminal automatically
//     context.logScreenSize();

// Example of conditional UI using the global extension
            // if (context.deviceType == DeviceType.desktop)
            //   const Text('💻 Showing Desktop Sidebar...')
            // else
            //   const Text('📱 Showing Mobile Bottom Navigation...'),