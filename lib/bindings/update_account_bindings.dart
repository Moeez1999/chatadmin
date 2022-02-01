import 'package:get/get.dart';
import 'package:web_admin_chat_app/controllers/login_controller.dart';
import 'package:web_admin_chat_app/controllers/update_account_controller.dart';

class UpdateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateAccountController>(
        () => UpdateAccountController());
  }
}