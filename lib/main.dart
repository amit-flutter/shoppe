import 'package:get/get.dart';
import 'package:shoppe/export.dart';
import 'package:shoppe/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Setting Up internet services.
  await Future.wait([InternetService().init()]);

  // Firebase Initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //Put Auth Controller to check user is login or not
  Get.put(AuthController());

  //Stat Flutter App
  runApp(const MyApp());
}

