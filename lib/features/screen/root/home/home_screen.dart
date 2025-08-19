import 'package:shoppe/export.dart';
import 'package:shoppe/features/screen/root/home/widgets/annoucement_widget.dart';
import 'package:shoppe/features/screen/root/home/widgets/app_bar_title_widget.dart';
import 'package:shoppe/features/screen/root/home/widgets/circle_image_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitleWidget(),
        actions: [
          CustomSvgImage(logo: ImageConst.kAppbar1),
          gap20,
          CustomSvgImage(logo: ImageConst.kAppbar2),
          gap10,
          CustomSvgImage(logo: ImageConst.kAppbar3),
          gap20,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: p20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: StringConst.helloUser, style: context.headlineLarge),
              gap12,
              AnnouncementWidget(),
              gap20,
              CustomText(text: StringConst.recentlyViewed, style: context.headlineLarge),
              RecentWidget(),
              gap20,
              CustomText(text: StringConst.myOrders, style: context.headlineLarge),
              // gap20,
              // CustomText(text: StringConst.stories, style: context.headlineLarge),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentWidget extends StatelessWidget {
  const RecentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        padding: p12,
        separatorBuilder: (context, index) => gap12,
        itemBuilder: (context, index) {
          return SizedBox(width: 80, height: 70, child: CircleImageWidget(size: 20));
        },
      ),
    );
  }
}
