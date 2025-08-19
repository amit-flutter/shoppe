import 'package:get/get.dart';
import 'package:shoppe/export.dart';
import 'package:shoppe/features/screen/on_bord/controller/on_bord_controller.dart';
import 'package:shoppe/features/screen/on_bord/model/on_bord_info_model.dart';

class OnBordScreen extends StatefulWidget {
  const OnBordScreen({super.key});

  @override
  State<OnBordScreen> createState() => _OnBordScreenState();
}

class _OnBordScreenState extends State<OnBordScreen> {
  final OnBordController controller = Get.put(OnBordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -Get.height / 6,
            left: -Get.width / 4,
            child: CustomSvgImage(logo: ImageConst.kBg1, height: Get.width / 1),
          ),
          Positioned(top: (Get.height - (Get.height / 3)), right: -100, child: CustomSvgImage(logo: ImageConst.kBg2)),
          SafeArea(
            child: SizedBox(
              height: Get.height,
              width: Get.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      margin: padXY(s24, s48),
                      height: Get.height,
                      width: Get.height,
                      clipBehavior: Clip.antiAlias,
                      decoration: Global.customShadow(color: ColorConst.kWhiteColor, borderRadius: borderRadius(30)),
                      child: PageView.builder(
                        itemCount: OnBoardInfoModel.onBoardInfoList.length,
                        controller: PageController(viewportFraction: 1),
                        onPageChanged: (index) {
                          controller.pageIndex.value = index;
                        },
                        itemBuilder: (BuildContext context, int itemIndex) {
                          return InfoCardWidget(model: OnBoardInfoModel.onBoardInfoList[itemIndex], index: itemIndex);
                        },
                      ),
                    ),
                  ),
                  Obx(() {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color:
                                controller.pageIndex.value == 0
                                    ? ColorConst.kPrimaryColor
                                    : ColorConst.kPrimaryColor.withValues(alpha: 0.2),
                            borderRadius: borderRadius(10),
                          ),
                        ),
                        gap20,
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color:
                                controller.pageIndex.value == 1
                                    ? ColorConst.kPrimaryColor
                                    : ColorConst.kPrimaryColor.withValues(alpha: 0.2),
                            borderRadius: borderRadius(10),
                          ),
                        ),
                      ],
                    );
                  }),
                  gap(30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({super.key, required this.model, required this.index});

  final OnBoardInfoModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.network(model.image, fit: BoxFit.fitWidth, width: Get.width)),
        Expanded(
          child: Padding(
            padding: p24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                gap2,
                CustomText(text: model.title, style: context.displayLarge, textAlign: TextAlign.center),
                CustomText(text: model.description, style: context.titleSmall, textAlign: TextAlign.center),
                gap2,
                if (index == 1)
                  ContainerButton(
                    height: 50,
                    margin: padX(30),
                    title: StringConst.letsStart,
                    onTap: () {
                      Get.offAllNamed(AppRoutes.rootScreen);
                    },
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
