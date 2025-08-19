import 'package:get/get.dart';
import 'package:shoppe/export.dart';

class AppRoutes {
  // Auth
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String onBord = '/on_bord';

  //App Start
  static const String rootScreen = '/rootScreen';

  final args = Get.arguments;
  static List<GetPage> getPages = [
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: registerScreen, page: () => RegisterScreen()),
    GetPage(name: onBord, page: () => OnBordScreen()),
    GetPage(name: rootScreen, page: () => RootScreen()),
  ];

  static void routingCallBack(Routing? routing) {
    if (routing != null) {
      debugPrint('♋️ [${routing.previous}] ➡️ [${routing.current}]  ');
    }
  }
}
