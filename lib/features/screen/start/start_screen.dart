import 'package:get/get.dart';
import 'package:shoppe/export.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [SizedBox(), HeaderWidget(), BottomWidget()],
          ),
        ),
      ),
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerButton(
          margin: p20,
          title: StringConst.letsGetStarted,
          style: context.titleSmall.withColor(ColorConst.kWhiteColor).copyWith(fontSize: s20),
          onTap: () => Get.offAllNamed(AppRoutes.registerScreen),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(text: StringConst.iAlreadyHaveAnAccount, style: context.titleSmall.copyWith(fontSize: s14)),
            gap6,
            InkWell(
              onTap: () => Get.offAllNamed(AppRoutes.loginScreen),
              child: Container(
                decoration: BoxDecoration(borderRadius: borderRadius(30), color: ColorConst.kPrimaryColor),
                padding: pad(3),
                child: Icon(Icons.arrow_forward_rounded, color: ColorConst.kWhiteColor, size: 16),
              ),
            ),
          ],
        ),
        gap20,
      ],
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: p24,
          decoration: Global.customShadow(color: ColorConst.kWhiteColor, borderRadius: borderRadius(100)),
          child: CustomSvgImage(logo: ImageConst.kAppLogo),
        ),
        gap24,
        CustomText(text: StringConst.appName, style: context.displayLarge),
        gap16,
        Padding(
          padding: padX(Get.width / 5),
          child: CustomText(
            text: StringConst.startScreenMessage,
            style: context.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
