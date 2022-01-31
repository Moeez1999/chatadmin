import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:web_admin_chat_app/controllers/add_signals_controller.dart';
import 'package:web_admin_chat_app/controllers/dashboard_controller.dart';
import 'package:web_admin_chat_app/controllers/login_controller.dart';
import 'package:web_admin_chat_app/view/app_header.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  

 



    return  Scaffold(
      body: GetBuilder<DashBoardController>(builder: (_){
        return Column(children: [
          Header()
        ],);
      },)
    );
  }
}