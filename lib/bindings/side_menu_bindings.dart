import 'package:get/get.dart';
import 'package:web_admin_chat_app/controllers/login_controller.dart';
import 'package:web_admin_chat_app/controllers/sidemenu_controller.dart';

class SidemenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SidebarController>(
        () => SidebarController());
  }
}