


import 'package:get/get.dart';
import 'package:web_admin_chat_app/bindings/add_signal_binding.dart';
import 'package:web_admin_chat_app/bindings/dashboard_bindings.dart';
import 'package:web_admin_chat_app/bindings/login_bindings.dart';
import 'package:web_admin_chat_app/bindings/side_menu_bindings.dart';
import 'package:web_admin_chat_app/bindings/update_account_bindings.dart';
import 'package:web_admin_chat_app/routes/app_routes.dart';
import 'package:web_admin_chat_app/view/add_signals.dart';
import 'package:web_admin_chat_app/view/dashboard.dart';
import 'package:web_admin_chat_app/view/login.dart';
import 'package:web_admin_chat_app/view/update_account.dart';
import 'package:web_admin_chat_app/widgets/app_side_menu.dart';

class AppPages {
  static const initial = Routes.loginRoutes;

  static List<GetPage> routes = [
    // < -------------------- Login Page ----------------->
    GetPage(
      name: Routes.loginRoutes,
      page: () => const Login(),
      binding: LoginBinding(),
    ),

    // < -------------------- SideBar Page ----------------->
    GetPage(
      name: Routes.sideBarRoutes,
      page: () => const SideBar (),
      binding: SidemenuBinding()
    ),

     // < -------------------- Dashboard Page ----------------->
    GetPage(
      name: Routes.dashboardRoutes,
      page: () => const DashBoard(),
      binding: DashboardBinding()
    ),


      // < -------------------- Add Signal Page ----------------->
    GetPage(
      name: Routes.addsignalRoutes,
      page: () => const AddSignals(),
      binding: AddSignalBinding()
    ),

       // < -------------------- Update Account Page ----------------->
    GetPage(
      name: Routes.updateaccountRoutes,
      page: () =>  UpdateAccount(),
      binding: UpdateAccountBinding()
    ),

  ];
}
