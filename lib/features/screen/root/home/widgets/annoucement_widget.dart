import 'package:shoppe/export.dart';

class AnnouncementWidget extends StatelessWidget {
  const AnnouncementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorConst.kLightGrey, borderRadius: borderRadius(10)),
      padding: padXY(s14, s10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: StringConst.announcement, style: context.titleMedium),
                CustomText(text: StringConst.onBoard2),
              ],
            ),
          ),
          gap6,
          Container(
            decoration: BoxDecoration(borderRadius: borderRadius(30), color: ColorConst.kPrimaryColor),
            padding: pad(3),
            child: Icon(Icons.arrow_forward_rounded, color: ColorConst.kWhiteColor, size: 25),
          ),
        ],
      ),
    );
  }
}
