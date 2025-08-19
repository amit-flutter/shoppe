import 'package:get/get.dart';
import 'package:shoppe/export.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Get.width / 1.5,
            right: -50,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(220 / 360),
              child: CustomSvgImage(logo: ImageConst.kBg1, height: Get.width / 3),
            ),
          ),
          Positioned(top: -Get.height / 16, left: 20, child: CustomSvgImage(logo: ImageConst.kBg2)),
          Positioned(
            top: -Get.height / 6,
            left: -Get.width / 4,
            child: CustomSvgImage(logo: ImageConst.kBg1, height: Get.width / 1),
          ),
          Positioned(top: (Get.height - (Get.height / 3)), right: -100, child: CustomSvgImage(logo: ImageConst.kBg2)),
          SingleChildScrollView(
            child: SizedBox(
              height: Get.height,
              child: Padding(
                padding: pad(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: StringConst.login, style: context.displayLarge),
                    gap4,
                    CustomText(text: StringConst.goodToSeeYouBack, style: context.titleSmall),
                    gap(50),
                    LoginFormWidget(),
                    gap(50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(hintText: StringConst.email),
        ),
        gap16,
        Obx(() {
          return TextField(
            controller: passwordController,
            obscureText: !authController.isPasswordVisible.value,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: StringConst.password,
              suffixIcon: InkWell(
                child: Icon(authController.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility),
                onTap: () {
                  authController.isPasswordVisible.toggle();
                },
              ),
            ),
          );
        }),
        gap(36),
        Obx(
          () =>
              authController.isLoading.value
                  ? CircularProgressIndicator()
                  : ContainerButton(
                    title: StringConst.login,
                    style: context.titleSmall.withColor(ColorConst.kWhiteColor).copyWith(fontSize: s20),
                    onTap: () {
                      authController.login(emailController.text.trim(), passwordController.text.trim());
                    },
                  ),
        ),
        gap20,
        InkWell(
          onTap: () => Get.offAllNamed(AppRoutes.registerScreen),
          child: CustomText(text: StringConst.register, style: context.titleSmall.copyWith(fontSize: s14)),
        ),
      ],
    );
  }
}
