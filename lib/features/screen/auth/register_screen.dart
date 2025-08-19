import 'package:get/get.dart';
import 'package:shoppe/export.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 0, right: -170, child: CustomSvgImage(logo: ImageConst.kBg1)),
          Positioned(top: -100, left: -170, child: CustomSvgImage(logo: ImageConst.kBg2)),
          SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: Get.height,
                child: Padding(
                  padding: pad(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText(text: StringConst.createAccount, style: context.displayLarge),
                      CustomSvgImage(logo: ImageConst.kCamera),
                      RegisterFormWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterFormWidget extends StatelessWidget {
  RegisterFormWidget({super.key});

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final numberController = TextEditingController();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: fullNameController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(hintText: StringConst.fullName),
        ),
        gap8,
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(hintText: StringConst.email),
        ),
        gap8,
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
        gap8,
        TextField(
          controller: numberController,
          keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: StringConst.yourNumber,
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                gap20,
                Image.asset(ImageConst.kFlag, height: 20, width: 20),
                SizedBox(height: 20, child: VerticalDivider(color: ColorConst.kBlackColor, width: 16, thickness: 1.5)),
              ],
            ),
          ),
        ),
        Obx(
          () =>
              authController.isLoading.value
                  ? CircularProgressIndicator()
                  : ContainerButton(
                    title: StringConst.register,
                    style: context.titleSmall.withColor(ColorConst.kWhiteColor).copyWith(fontSize: s20),
                    onTap: () {
                      authController.register(emailController.text.trim(), passwordController.text.trim());
                    },
                  ),
        ),
        gap20,
        InkWell(
          onTap: () => Get.offAllNamed(AppRoutes.loginScreen),
          child: CustomText(text: StringConst.login, style: context.titleSmall.copyWith(fontSize: s14)),
        ),
      ],
    );
  }
}
