import 'package:shoppe/export.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    super.key,
    required this.title,
    required this.onTap,
    this.height = 60,
    this.padding = p0,
    this.margin = py8,
    this.borderColor = ColorConst.kPrimaryColor,
    this.background = ColorConst.kPrimaryColor,
    this.textColor = ColorConst.kWhiteColor,
    this.radius = 16,
    this.style,
    this.isLoading = false,
    this.align = Alignment.center,
    this.titleWidget,
  });

  final String title;
  final Widget? titleWidget;
  final TextStyle? style;
  final VoidCallback? onTap;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color borderColor;
  final Color background;
  final Color textColor;
  final double radius;
  final bool? isLoading;
  final Alignment? align;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 0,
      onTap: (isLoading ?? false) ? null : onTap,
      child: Container(
        height: height,
        margin: margin,
        padding: padding,
        alignment: align,
        decoration: getContainerDecoration(
          borderColor: onTap == null ? ColorConst.kGrey300 : borderColor,
          background: onTap == null ? ColorConst.kGrey300 : background,
          radius: radius,
        ),
        child:
            isLoading!
                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white))
                : titleWidget ??
                    CustomText(
                      text: title,
                      style:
                          style ?? context.bodyLarge.withColor(onTap == null ? ColorConst.kWhiteColor : textColor).w600,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
      ),
    );
  }
}

class RoundImage extends StatelessWidget {
  const RoundImage({
    super.key,
    required this.image,
    required this.imageColor,
    this.onTap,
    this.borderColor,
    this.bgColor,
    this.padding = p10,
  });

  final String image;
  final EdgeInsets padding;
  final Color? borderColor;
  final Color? bgColor;
  final Color imageColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 0,
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: borderColor ?? imageColor),
          color: bgColor ?? imageColor,
        ),
        padding: padding,
        child: CustomSvgImage(logo: image, color: imageColor),
      ),
    );
  }
}

// class DottedButton extends StatelessWidget {
//   final String? localImage;
//   final GestureTapCallback onTap;
//   final EdgeInsetsGeometry? padding;
//   final double? height;
//   final double? centerIconSize;
//
//   const DottedButton({
//     super.key,
//     required this.onTap,
//     this.padding,
//     this.localImage,
//     this.height,
//     this.centerIconSize = 60,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.translucent,
//       onTap: onTap,
//       child: Container(
//         height: height,
//         width: height,
//         clipBehavior: Clip.antiAlias,
//         decoration: BoxDecoration(color: ColorConst.kLightGrey, borderRadius: borderRadius(6)),
//         child: DottedBorder(
//           borderType: BorderType.RRect,
//           color: ColorConst.kGrey300,
//           dashPattern: const [8, 8],
//           strokeWidth: 2,
//           radius: const Radius.circular(6),
//           padding: EdgeInsets.zero,
//           child: Center(
//             child: Icon(
//               Icons.add_rounded,
//               color: ColorConst.kGrey400,
//               size: centerIconSize,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class IncrementDecrementButton extends StatelessWidget {

  const IncrementDecrementButton({
    super.key,
    required this.currentCount,
    required this.onIncrement,
    required this.onDecrement,
    this.spacing = 20.0,
    this.countTextStyle,
    this.borderColor = ColorConst.kBlueBorder,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
  });
  final int currentCount;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final double spacing;
  final TextStyle? countTextStyle;
  final Color borderColor;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: borderColor), borderRadius: borderRadius),
      child: Row(
        children: [
          InkWell(
            onTap: onDecrement,
            child: Padding(padding: p6, child: Icon(Icons.remove, color: borderColor, size: 16)),
          ),
          SizedBox(width: spacing),
          CustomText(text: currentCount.toString(), style: countTextStyle),
          SizedBox(width: spacing),
          InkWell(
            onTap: onIncrement,
            child: Padding(padding: p6, child: Icon(Icons.add, color: borderColor, size: 16)),
          ),
        ],
      ),
    );
  }
}
