import 'package:flutter/material.dart';

extension FastTextStyle on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle get bodySmall => textTheme.bodySmall!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get labelSmall => textTheme.labelSmall!;
  TextStyle get labelMedium => textTheme.labelMedium!;
  TextStyle get labelLarge => textTheme.labelLarge!;
  TextStyle get titleSmall => textTheme.titleSmall!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleLarge => textTheme.titleLarge!;
  TextStyle get headlineSmall => textTheme.headlineSmall!;
  TextStyle get headlineMedium => textTheme.headlineMedium!;
  TextStyle get headlineLarge => textTheme.headlineLarge!;
  TextStyle get displaySmall => textTheme.displaySmall!;
  TextStyle get displayMedium => textTheme.displayMedium!;
  TextStyle get displayLarge => textTheme.displayLarge!;
  TextStyle get primary => TextStyle(color: Theme.of(this).colorScheme.primary);
}

extension FastColor on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primaryColor => colorScheme.primary;
  Color get secondaryColor => colorScheme.secondary;
  Color get backgroundColor => colorScheme.surface;
  Color get surfaceColor => colorScheme.surface;
  Color get errorColor => colorScheme.error;

  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get onSecondaryColor => colorScheme.onSecondary;
  Color get onBackgroundColor => colorScheme.onSurface;
  Color get onSurfaceColor => colorScheme.onSurface;
  Color get onErrorColor => colorScheme.onError;

  // Custom common colors
  Color get whiteColor => Colors.white;
  Color get blackColor => Colors.black;
  Color get transparentColor => Colors.transparent;
  Color get greyColor => Colors.grey;
}
