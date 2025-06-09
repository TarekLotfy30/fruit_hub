import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../styles/app_fonts_family.dart';
import '../styles/app_typography.dart';

/// A comprehensive theme configuration class for the application.
/// Provides both light and dark theme modes with consistent styling.

class AppTheme {
  // Private constructor to prevent instantiation.
  AppTheme._();

  /// Standard page transitions for the application
  static const PageTransitionsTheme _pageTransitionsTheme =
      PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      );

  /// Base text theme using the primary font family
  static final TextTheme _baseTextTheme = TextTheme(
    displaySmall: AppTypography.displaySmall,
    titleSmall: AppTypography.titleSmall,
    titleMedium: AppTypography.titleMedium,
    bodySmall: AppTypography.bodySmall,
    bodyMedium: AppTypography.bodyMedium,
    bodyLarge: AppTypography.bodyLarge,
    labelMedium: AppTypography.labelMedium,
    labelLarge: AppTypography.labelLarge,
  );

  /// Light theme color scheme
  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.textOnPrimary,
    primaryContainer: AppColors.green100,
    onPrimaryContainer: AppColors.green900,
    secondary: AppColors.secondary,
    onSecondary: AppColors.textOnSecondary,
    secondaryContainer: AppColors.orange100,
    onSecondaryContainer: AppColors.orange900,
    tertiary: AppColors.accent,
    onTertiary: AppColors.white,
    tertiaryContainer: AppColors.green1_100,
    onTertiaryContainer: AppColors.green1_900,
    error: AppColors.error,
    onError: AppColors.white,
    errorContainer: Color(0xFFFEE2E2),
    onErrorContainer: Color(0xFF7F1D1D),
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
    surfaceContainerHighest: AppColors.grayscale50,
    onSurfaceVariant: AppColors.textSecondary,
    outline: AppColors.border,
    outlineVariant: AppColors.divider,
    shadow: AppColors.grayscale900,
    scrim: AppColors.black,
    inverseSurface: AppColors.grayscale800,
    onInverseSurface: AppColors.grayscale100,
    inversePrimary: AppColors.green200,
    surfaceTint: AppColors.primary,
  );

  /// Dark theme color scheme
  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.green400,
    onPrimary: AppColors.grayscale900,
    primaryContainer: AppColors.green800,
    onPrimaryContainer: AppColors.green100,
    secondary: AppColors.orange400,
    onSecondary: AppColors.grayscale900,
    secondaryContainer: AppColors.orange800,
    onSecondaryContainer: AppColors.orange100,
    tertiary: AppColors.green1_400,
    onTertiary: AppColors.grayscale900,
    tertiaryContainer: AppColors.green1_800,
    onTertiaryContainer: AppColors.green1_100,
    error: Color(0xFFF87171),
    onError: Color(0xFF7F1D1D),
    errorContainer: Color(0xFF7F1D1D),
    onErrorContainer: Color(0xFFFEE2E2),
    surface: Color(0xFF1A1A1A),
    onSurface: AppColors.grayscale100,
    surfaceContainerHighest: AppColors.grayscale800,
    onSurfaceVariant: AppColors.grayscale300,
    outline: AppColors.grayscale600,
    outlineVariant: AppColors.grayscale700,
    shadow: AppColors.black,
    scrim: AppColors.black,
    inverseSurface: AppColors.grayscale100,
    onInverseSurface: AppColors.grayscale800,
    inversePrimary: AppColors.green600,
    surfaceTint: AppColors.green400,
  );

  /// Defines the light mode theme.
  static ThemeData lightMode = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    fontFamily: AppFontFamily.cairo,
    scaffoldBackgroundColor: _lightColorScheme.surface,
    textTheme: _baseTextTheme.apply(
      displayColor: _lightColorScheme.onSurface,
      bodyColor: _lightColorScheme.onSurface,
    ),
    pageTransitionsTheme: _pageTransitionsTheme,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: _lightColorScheme.primary,
    //   foregroundColor: _lightColorScheme.onPrimary,
    //   elevation: 0,
    //   centerTitle: true,
    //   titleTextStyle: _baseTextTheme.titleLarge?.copyWith(
    //     fontWeight: FontWeight.bold,
    //     color: _lightColorScheme.onPrimary,
    //   ),
    // ),
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: _lightColorScheme.primary,
    //   foregroundColor: _lightColorScheme.onPrimary,
    //   elevation: 0,
    //   shape: const CircleBorder(),
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: _lightColorScheme.primary,
    //     foregroundColor: _lightColorScheme.onPrimary,
    //     elevation: 0,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    //     padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    //     textStyle: _baseTextTheme.labelLarge?.copyWith(
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: _lightColorScheme.surface,
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10),
    //     borderSide: BorderSide.none,
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10),
    //     borderSide: BorderSide(
    //       color: _lightColorScheme.onSurface.withOpacity(0.1),
    //       width: 0.85,
    //     ),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10),
    //     borderSide: BorderSide(color: _lightColorScheme.primary, width: 1.5),
    //   ),
    //   labelStyle: _baseTextTheme.bodyMedium?.copyWith(
    //     fontSize: 13,
    //     color: _lightColorScheme.onSurface.withOpacity(0.6),
    //   ),
    //   floatingLabelStyle: TextStyle(
    //     color: _lightColorScheme.primary,
    //     fontSize: 13,
    //   ),
    //   contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    //   prefixIconColor: _lightColorScheme.primary,
    //   suffixIconColor: _lightColorScheme.primary,
    // ),
    // cardTheme: CardTheme(
    //   elevation: 0,
    //   margin: EdgeInsets.zero,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   color: _lightColorScheme.surface,
    // ),
    // dividerTheme: DividerThemeData(
    //   color: _lightColorScheme.onSurface.withOpacity(0.1),
    //   thickness: 1,
    //   space: 1,
    // ),
  );

  /// Dark theme configuration
  static ThemeData get darkMode => ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    fontFamily: AppFontFamily.cairo,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _darkColorScheme.surface,
    textTheme: _baseTextTheme.apply(
      displayColor: _darkColorScheme.onSurface,
      bodyColor: _darkColorScheme.onSurface,
    ),
    pageTransitionsTheme: _pageTransitionsTheme,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: _darkColorScheme.surface,
    //   foregroundColor: _darkColorScheme.onSurface,
    //   elevation: 0,
    //   centerTitle: true,
    //   titleTextStyle: _baseTextTheme.titleLarge?.copyWith(
    //     fontWeight: FontWeight.bold,
    //     color: _darkColorScheme.onSurface,
    //   ),
    // ),
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: _darkColorScheme.primary,
    //   foregroundColor: _darkColorScheme.onPrimary,
    //   elevation: 0,
    //   shape: const CircleBorder(),
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: _darkColorScheme.primary,
    //     foregroundColor: _darkColorScheme.onPrimary,
    //     elevation: 0,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    //     padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    //     textStyle: _baseTextTheme.labelLarge?.copyWith(
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: _darkColorScheme.surface,
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10),
    //     borderSide: BorderSide.none,
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10),
    //     borderSide: BorderSide(
    //       color: _darkColorScheme.onSurface.withOpacity(0.1),
    //       width: 0.85,
    //     ),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10),
    //     borderSide: BorderSide(color: _darkColorScheme.primary, width: 1.5),
    //   ),
    //   labelStyle: _baseTextTheme.bodyMedium?.copyWith(
    //     fontSize: 13,
    //     color: _darkColorScheme.onSurface.withOpacity(0.6),
    //   ),
    //   floatingLabelStyle: TextStyle(
    //     color: _darkColorScheme.primary,
    //     fontSize: 13,
    //   ),
    //   contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    //   prefixIconColor: _darkColorScheme.primary,
    //   suffixIconColor: _darkColorScheme.primary,
    // ),
    // cardTheme: CardTheme(
    //   elevation: 0,
    //   margin: EdgeInsets.zero,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   color: _darkColorScheme.surface,
    // ),
    // dividerTheme: DividerThemeData(
    //   color: _darkColorScheme.onSurface.withOpacity(0.1),
    //   thickness: 1,
    //   space: 1,
    // ),
  );
}




// // ========== THEME IMPLEMENTATION ==========
// class AppTheme {
//   static ThemeData get lightTheme {
//     return ThemeData(
//       useMaterial3: true,
//       colorScheme: AppColorSchema.lightColorScheme,
      
//       // App Bar Theme
//       appBarTheme: AppBarTheme(
//         backgroundColor: AppColorSchema.surface,
//         foregroundColor: AppColorSchema.textPrimary,
//         elevation: 0,
//         scrolledUnderElevation: 1,
//         surfaceTintColor: AppColorSchema.primary,
//       ),
      
//       // Button Themes
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColorSchema.primary,
//           foregroundColor: AppColorSchema.textOnPrimary,
//           elevation: 2,
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
      
//       filledButtonTheme: FilledButtonThemeData(
//         style: FilledButton.styleFrom(
//           backgroundColor: AppColorSchema.primary,
//           foregroundColor: AppColorSchema.textOnPrimary,
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
      
//       outlinedButtonTheme: OutlinedButtonThemeData(
//         style: OutlinedButton.styleFrom(
//           foregroundColor: AppColorSchema.primary,
//           side: BorderSide(color: AppColorSchema.border),
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
      
//       // Input Decoration
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: AppColorSchema.grayscale50,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: AppColorSchema.border),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: AppColorSchema.primary, width: 2),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: AppColorSchema.border),
//         ),
//       ),
      
//       // Card Theme
//       cardTheme: CardTheme(
//         color: AppColorSchema.surface,
//         elevation: 2,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
      
//       // Divider Theme
//       dividerTheme: DividerThemeData(
//         color: AppColorSchema.divider,
//         thickness: 1,
//       ),
//     );
//   }

//   static ThemeData get darkTheme {
//     return ThemeData(
//       useMaterial3: true,
//       colorScheme: AppColorSchema.darkColorScheme,
      
//       // Apply similar theming for dark mode with appropriate colors
//       appBarTheme: AppBarTheme(
//         backgroundColor: AppColorSchema.darkColorScheme.surface,
//         foregroundColor: AppColorSchema.darkColorScheme.onSurface,
//         elevation: 0,
//         scrolledUnderElevation: 1,
//         surfaceTintColor: AppColorSchema.darkColorScheme.primary,
//       ),
      
//       // Use the same button themes but colors will adapt automatically
//       elevatedButtonTheme: lightTheme.elevatedButtonTheme,
//       filledButtonTheme: lightTheme.filledButtonTheme,
//       outlinedButtonTheme: lightTheme.outlinedButtonTheme,
//       inputDecorationTheme: lightTheme.inputDecorationTheme,
//       cardTheme: lightTheme.cardTheme,
//       dividerTheme: lightTheme.dividerTheme,
//     );
//   }
// }

// // ========== USAGE EXAMPLES ==========
// /*
// // In main.dart:
// MaterialApp(
//   theme: AppTheme.lightTheme,
//   darkTheme: AppTheme.darkTheme,
//   themeMode: ThemeMode.system,
//   home: MyHomePage(),
// )

// // Using colors in widgets:
// Container(
//   color: AppColorSchema.primary,
//   child: Text(
//     'Hello',
//     style: TextStyle(color: AppColorSchema.textOnPrimary),
//   ),
// )

// // Using theme colors:
// Container(
//   color: Theme.of(context).colorScheme.primary,
//   child: Text(
//     'Hello',
//     style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
//   ),
// )

// // Success message:
// Container(
//   padding: EdgeInsets.all(16),
//   decoration: BoxDecoration(
//     color: AppColorSchema.success,
//     borderRadius: BorderRadius.circular(8),
//   ),
//   child: Text(
//     'Success!',
//     style: TextStyle(color: AppColorSchema.textOnPrimary),
//   ),
// )
// */