import 'package:shoppe/export.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Container(
          alignment: Alignment.center,
          height: double.infinity,
          child: Padding(
            padding: padX(s24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSvgImage(logo: ImageConst.imgNoInternet, width: MediaQuery.of(context).size.width / 2),
                gap10,
                CustomText(text: StringConst.noInternet, style: context.titleLarge.w400),
                gap12,
                CustomText(
                  textAlign: TextAlign.center,
                  text: StringConst.noInternetDescription,
                  style: context.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
