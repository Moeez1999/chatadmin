import 'package:get/get.dart';
import 'package:web_admin_chat_app/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController());
  }
}