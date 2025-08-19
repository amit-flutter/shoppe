import 'package:shoppe/export.dart';

class CustomSvgImage extends StatelessWidget {

  const CustomSvgImage({
    super.key,
    required this.logo,
    this.fit,
    this.width,
    this.height,
    this.color,
    this.alignment = Alignment.center,
  });
  final String logo;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color? color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return logo.containsAny(['png', 'jpg', 'jpeg'])
        ? Image.asset(logo, fit: fit ?? BoxFit.contain, width: width, height: height, alignment: alignment)
        : SvgPicture.asset(
          logo,
          fit: fit ?? BoxFit.contain,
          width: width,
          height: height,
          alignment: alignment,
          colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
        );
  }
}
