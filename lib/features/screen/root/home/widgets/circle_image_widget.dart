import 'package:shoppe/export.dart';

class CircleImageWidget extends StatelessWidget {
  const CircleImageWidget({super.key, this.size = 14});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConst.kWhiteColor,
        borderRadius: borderRadius(100),
        boxShadow: [
          BoxShadow(
            color: ColorConst.kBlackColor.withValues(alpha: 0.3),
            blurRadius: 3,
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      padding: pad(4),
      child: CircleAvatar(
        radius: size, // Image radius
        backgroundImage: NetworkImage(
          'https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg',
        ),
      ),
    );
  }
}
