import 'package:shoppe/export.dart';

//App Constant
const double bannerRatio = 382 / 187;
const double loaderHeight = 50;

const kDivGray20 = Divider(color: ColorConst.kRed, height: s20);

//Size
const double s0 = 0;
const double s2 = 2;
const double s4 = 4;
const double s6 = 6;
const double s8 = 8;
const double s10 = 10;
const double s12 = 12;
const double s14 = 14;
const double s16 = 16;
const double s20 = 20;
const double s24 = 24;
const double s44 = 44;
const double s48 = 48;

double s(double value) => value;

//Time delay
Duration get delay0 => Duration.zero;

Duration get delay1 => const Duration(seconds: 1);

//Size
Size size(double size) => Size.fromHeight(size);
const Size size2 = Size.fromHeight(2);
const Size size48 = Size.fromHeight(48);
const Size size56 = Size.fromHeight(56);

//Radius
const Radius radius6 = Radius.circular(6);
const Radius radius60 = Radius.circular(60);

Radius radius(double r) => Radius.circular(r);

BorderRadius borderRadius(double r) => BorderRadius.circular(r);

//SizedBox
const SizedBox gap2 = SizedBox(height: 2, width: 2);
const SizedBox gap4 = SizedBox(height: 4, width: 4);
const SizedBox gap6 = SizedBox(height: 6, width: 6);
const SizedBox gap8 = SizedBox(height: 8, width: 8);
const SizedBox gap10 = SizedBox(height: 10, width: 10);
const SizedBox gap12 = SizedBox(height: 12, width: 12);
const SizedBox gap16 = SizedBox(height: 16, width: 16);
const SizedBox gap20 = SizedBox(height: 20, width: 20);
const SizedBox gap24 = SizedBox(height: 24, width: 24);

SizedBox gap(double size) => SizedBox(height: size, width: size);

// EdgeInsets
const EdgeInsets p0 = EdgeInsets.all(0);
const EdgeInsets p2 = EdgeInsets.all(2);
const EdgeInsets p6 = EdgeInsets.all(6);
const EdgeInsets p8 = EdgeInsets.all(8);
const EdgeInsets p10 = EdgeInsets.all(10);
const EdgeInsets p12 = EdgeInsets.all(12);
const EdgeInsets p16 = EdgeInsets.all(16);
const EdgeInsets p20 = EdgeInsets.all(20);
const EdgeInsets p24 = EdgeInsets.all(24);

const EdgeInsets py8 = EdgeInsets.symmetric(vertical: 8);

EdgeInsets pad(double padding) => EdgeInsets.all(padding);

EdgeInsets padOnly({double top = 0, double bottom = 0, double left = 0, double right = 0}) =>
    EdgeInsets.only(top: top, bottom: bottom, left: left, right: right);

EdgeInsets padXY(double paddingX, double paddingY) =>
    EdgeInsets.only(top: paddingY, bottom: paddingY, left: paddingX, right: paddingX);

EdgeInsets padX(double paddingX) => EdgeInsets.symmetric(horizontal: paddingX);

EdgeInsets padY(double paddingY) => EdgeInsets.symmetric(vertical: paddingY);

BoxDecoration getContainerDecoration({
  Color borderColor = ColorConst.kPrimaryColor,
  double radius = 8.0,
  Color? background,
}) {
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    border: Border.fromBorderSide(BorderSide(color: borderColor)),
    color: background,
  );
}
