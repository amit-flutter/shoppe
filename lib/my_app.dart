import 'package:shoppe/export.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConst.appName,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      getPages: AppRoutes.getPages,
      home: Obx(() {
        if (authController.firebaseUser.value == null) {
          return StartScreen();
        } else if (authController.firebaseUser.value != null) {
          return RootScreen();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
      routingCallback: (route) => AppRoutes.routingCallBack(route),
      builder: (context, child) {
        return InternetHandler(
          child: MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling), child: child!),
        );
      },
    );
  }
}
