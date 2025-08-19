import 'package:shoppe/export.dart';

extension CustomContaine on Container {
  Container withRadius(double radius) {
    return Container(
      decoration: BoxDecoration(
        color: (decoration as BoxDecoration?)?.color ?? color,
        borderRadius: BorderRadius.circular(radius),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: constraints?.maxWidth,
      height: constraints?.maxHeight,
      alignment: alignment,
      margin: margin,
      padding: padding,
      child: child,
    );
  }
}

extension CommonWidget on Widget {
  Widget withColor({Color? color, radius}) {
    return Container(
      color: color ?? ColorConst.kRed,
      child: this,
    );
  }

  Widget withBorder({Color? color, double? radius, Color? borderColor, EdgeInsets? padding, EdgeInsets? margin}) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? ColorConst.kRed,
        borderRadius: borderRadius(radius ?? s0),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: this,
    );
  }

  Widget expanded({int? flex}) {
    return Expanded(flex: flex ?? 1, child: this);
  }

  Widget flexible({int? flex}) {
    return Flexible(flex: flex ?? 1, child: this);
  }
}

extension ListExtensions<T> on List<T>? {
  T? elementAtOrNull(int index) {
    return (this != null && this!.length > index) ? this![index] : null;
  }
}
