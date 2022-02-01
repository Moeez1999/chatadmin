import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:web_admin_chat_app/controllers/add_signals_controller.dart';
import 'package:web_admin_chat_app/view/app_header.dart';


class AddSignals extends StatelessWidget {
  const AddSignals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  GetBuilder<AddSignalsController>(
     init: AddSignalsController(),
     builder: (_){
        return Scaffold(
          body: Column(children: [
            Header()
          ],),
        );
      },);

 



    
  }
}