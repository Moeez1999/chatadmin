import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_admin_chat_app/controllers/add_signals_controller.dart';
import 'package:web_admin_chat_app/view/app_header.dart';
import 'package:web_admin_chat_app/widgets/app_buttons.dart';
import 'package:web_admin_chat_app/widgets/app_textfield.dart';


class AddSignals extends StatelessWidget {
  const AddSignals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  GetBuilder<AddSignalsController>(
     init: AddSignalsController(),
     builder: (_){
        return Scaffold(
          body: Column(children: [
            Header(),
             Row(

                            children: const[
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  'Add Signals',
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40,),
                           Text(
                                  'Add Singals Information',
                                  style: GoogleFonts.mochiyPopOne(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                const SizedBox(height: 40,),
                                  Form(
                                    key: _.formKey,
                                    child: Column(
                                      children: [
                                        Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 139,vertical: 30),
                                        child: CommonTextFormField1(
                                          _.title,
                                          'Enter Title',
                                          'Title',
                                          false,
                                          TextInputType.name,
                                        
                                           (value) {
                                            return (value!.isEmpty)
                                                ? 'Title can not be empty'
                                                : null;
                                          },
                                        
                                          
                                        ),
                                                                  ),
                                                                   Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 139),
                                    child: CommonTextFormField1(
                                      _.subtitle,
                                      'Enter Subtitle',
                                      'Subtitle',
                                      false,
                                      TextInputType.name,
                                    
                                       (value) {
                                        return (value!.isEmpty)
                                            ? 'Subtitle can not be empty'
                                            : null;
                                      },
                                    
                                      
                                    ),
                                                                  ),
                                      ],
                                    ),
                                  ),
                                const SizedBox(height: 70),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularButtons(
                                      backgroundColor:
                                          const Color(0xfffc6359),
                                      borderColor: const Color(0xfffc6359),
                                      text: "Add",
                                      height: 50,
                                      width:
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                      onPressed: () {
                                         if (_.validateAndSaveUser()) {
                           _.handleSubmit();
                        } else {
                          Get.snackbar("Error", "Fill all fields",
                              backgroundColor: Colors.red);
                          
                        }
                                         
                                      },
                                      textColor: Colors.white,
                                      textStyle: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
          ],),
        );
      },);

 



    
  }
}