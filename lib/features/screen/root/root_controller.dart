import 'package:get/get.dart';

class RootController extends GetxController {
  static RootController get to => Get.isRegistered<RootController>() ? Get.find() : Get.put(RootController());

  RxInt selectedIndex = 0.obs;
}
