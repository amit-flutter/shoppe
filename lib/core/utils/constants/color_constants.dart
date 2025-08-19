import 'package:shoppe/export.dart';

//TODO: Code Clean UP
class ColorConst {
  static const kPrimaryColor = Color(0xFF004CFF);
  static const kSecondaryColor = Color(0xFF9AD7D4);
  static const kBlueBorder = Color(0xFF333D4C);
  static const kRed = Color(0xFFD12929);

  static const kLightGrey = Color(0xFFF8F8F8);
  static const kGrey200 = Color(0xFF000000);
  static const kGrey300 = Color(0xFF969696);
  static const kBlackColor = Color(0xFF000000);
  static const kWhiteColor = Color(0xFFffffff);
}

extension MaterialCode on Color {
  MaterialColor toMaterialColor() {
    final List<double> strengths = <double>[.05];
    final Map<int, Color> swatch = {};
    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (final strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        (r + ((ds < 0 ? r : (255 - r)) * ds).round()).toInt(),
        (g + ((ds < 0 ? g : (255 - g)) * ds).round()).toInt(),
        (b + ((ds < 0 ? b : (255 - b)) * ds).round()).toInt(),
        1,
      );
    }
    return MaterialColor(hashCode, swatch);
  }
}
