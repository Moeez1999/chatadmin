import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:web_admin_chat_app/controllers/add_signals_controller.dart';
import 'package:web_admin_chat_app/controllers/login_controller.dart';

class AddSignals extends StatelessWidget {
  const AddSignals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  

 



    return  Scaffold(
      body: GetBuilder<AddSignalsController>(builder: (_){
        return Column();
      },)
    );
  }
}