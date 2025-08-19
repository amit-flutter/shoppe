import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shoppe/export.dart';
import 'package:shoppe/features/screen/auth/auth_services.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  final AuthService _authService = AuthService();

  var isLoading = false.obs;
  var firebaseUser = Rxn<User>();
  RxBool isPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_authService.userStream);
  }

  Future<void> login(String email, String password) async {
    try {
      if (email.isTextBlank()) {
        Get.snackbar("Error", "Please enter email", snackPosition: SnackPosition.BOTTOM);
        return;
      } else if (password.isTextBlank()) {
        Get.snackbar("Error", "Please enter password", snackPosition: SnackPosition.BOTTOM);
        return;
      } else {
        isLoading.value = true;
        await _authService.login(email, password);
        Get.snackbar("Success", "Logged in successfully", snackPosition: SnackPosition.BOTTOM);
        Get.offAllNamed(AppRoutes.onBord);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(String email, String password) async {
    try {
      if (email.isTextBlank()) {
        Get.snackbar("Error", "Please enter email", snackPosition: SnackPosition.BOTTOM);
        return;
      } else if (password.isTextBlank()) {
        Get.snackbar("Error", "Please enter email", snackPosition: SnackPosition.BOTTOM);
        return;
      } else {
        isLoading.value = true;
        await _authService.register(email, password);
        Get.snackbar("Success", "Account created successfully", snackPosition: SnackPosition.BOTTOM);
        Get.offAllNamed(AppRoutes.onBord);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
