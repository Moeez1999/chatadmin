import 'package:get/get.dart';
import 'package:web_admin_chat_app/controllers/dashboard_controller.dart';
import 'package:web_admin_chat_app/controllers/login_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(
        () => DashBoardController());
  }
}