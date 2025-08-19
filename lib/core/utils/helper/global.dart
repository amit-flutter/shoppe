import 'package:shoppe/export.dart';

class Global {
  var isInterNetExist = 0;
  static hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static SystemUiOverlayStyle customOverLay({required Color color, bool isLight = false}) => SystemUiOverlayStyle(
    systemNavigationBarColor: color,
    systemNavigationBarIconBrightness: isLight ? Brightness.light : Brightness.dark,
  );

  static BoxDecoration customShadow({Color? color, BorderRadius? borderRadius}) {
    return BoxDecoration(
      color: color ?? ColorConst.kWhiteColor,
      borderRadius: borderRadius,
      boxShadow: [
        BoxShadow(
          color: ColorConst.kBlackColor.withValues(alpha: 0.3),
          blurRadius: 10,
          spreadRadius: 0,
          offset: Offset(0, 0),
        ),
      ],
    );
  }
}
