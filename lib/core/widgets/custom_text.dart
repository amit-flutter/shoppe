import 'package:shoppe/export.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.style,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.fontColor,
    this.fontDecoration,
    this.backgroundColor,
    this.textAlign,
    this.overflow = TextOverflow.clip,
  });
  final String? text;
  final TextStyle? style;
  final double? fontSize;
  final Color? fontColor;
  final Color? backgroundColor;
  final TextDecoration? fontDecoration;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      style: style ?? Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class TitleSubtitleText extends StatelessWidget {
  const TitleSubtitleText({
    super.key,
    required this.title,
    this.mainAxis,
    this.subtitle,
    this.titleStyle,
    this.subTitleStyle,
  });

  final MainAxisAlignment? mainAxis;
  final String? title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          CustomText(
            text: title,
            style: titleStyle ?? context.bodySmall.copyWith(color: ColorConst.kRed, fontWeight: FontWeight.w500),
          ),
        gap2,
        if (subtitle != null) CustomText(text: subtitle, style: subTitleStyle ?? context.bodyMedium.w500),
      ],
    );
  }
}
