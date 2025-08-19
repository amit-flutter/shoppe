import 'package:shoppe/export.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    unselectedWidgetColor: ColorConst.kGrey300,
    primarySwatch: ColorConst.kPrimaryColor.toMaterialColor(),
    primaryColor: ColorConst.kPrimaryColor,
    buttonTheme: _lightButtonTheme,
    colorScheme: _lightColorScheme,
    textTheme: _lightTextTheme,
    tabBarTheme: _lightTabBarTheme,
    pageTransitionsTheme: _pageTransitionsTheme,
    inputDecorationTheme: _lightInputDecorationTheme,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    dividerTheme: const DividerThemeData(color: ColorConst.kGrey300, thickness: 1),
  );

  static const ColorScheme _lightColorScheme = ColorScheme.light(
    primary: ColorConst.kPrimaryColor,
    onSurface: Color(0xDE04294E),
    secondary: ColorConst.kSecondaryColor,
    onSecondary: Colors.cyan,
  );

  static const InputDecorationTheme _lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: ColorConst.kLightGrey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(radius60),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(radius60),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(radius60),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(radius60),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(radius60),
      borderSide: BorderSide(color: ColorConst.kRed),
    ),
  );

  static const ButtonThemeData _lightButtonTheme = ButtonThemeData(
    buttonColor: ColorConst.kPrimaryColor,
    disabledColor: ColorConst.kGrey300,
  );

  static const TextTheme _lightTextTheme = TextTheme(
    labelSmall: TextStyle(color: ColorConst.kBlackColor, fontSize: 10),
    labelLarge: TextStyle(color: ColorConst.kBlackColor, fontSize: 12, fontWeight: FontWeight.w600),
    bodySmall: TextStyle(color: ColorConst.kBlackColor, fontSize: 12),
    bodyMedium: TextStyle(color: ColorConst.kBlackColor, fontSize: 14),
    bodyLarge: TextStyle(color: ColorConst.kBlackColor, fontSize: 16),
    titleSmall: TextStyle(color: ColorConst.kBlackColor, fontSize: 16, fontWeight: FontWeight.w300),
    titleMedium: TextStyle(color: ColorConst.kBlackColor, fontSize: 16, fontWeight: FontWeight.w700),
    titleLarge: TextStyle(color: ColorConst.kBlackColor, fontSize: 20, fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(color: ColorConst.kBlackColor, fontSize: 18, fontWeight: FontWeight.w500),
    headlineLarge: TextStyle(color: ColorConst.kBlackColor, fontSize: 28, fontWeight: FontWeight.w700),
    displayLarge: TextStyle(color: ColorConst.kBlackColor, fontSize: 52, fontWeight: FontWeight.w700),
  );

  static const TabBarTheme _lightTabBarTheme = TabBarTheme(
    splashFactory: NoSplash.splashFactory,
    unselectedLabelColor: ColorConst.kGrey200,
    indicatorColor: ColorConst.kPrimaryColor,
    dividerColor: ColorConst.kGrey200,
    dividerHeight: 3,
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: ColorConst.kPrimaryColor,
    textScaler: TextScaler.noScaling,
    indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 3, color: ColorConst.kPrimaryColor)),
  );

  static final PageTransitionsTheme _pageTransitionsTheme = const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );
}
