import 'package:get/get.dart';
import 'package:web_admin_chat_app/controllers/add_signals_controller.dart';


class AddSignalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddSignalsController>(
        () => AddSignalsController());
  }
}