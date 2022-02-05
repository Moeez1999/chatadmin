import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:web_admin_chat_app/controllers/add_signals_images_controller.dart';
import 'package:web_admin_chat_app/view/app_header.dart';
import 'package:web_admin_chat_app/widgets/app_buttons.dart';
import 'package:web_admin_chat_app/widgets/app_dropdown.dart';



class AddSignalsImages extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
   return  GetBuilder<SingalImagesController>(
     init: SingalImagesController(),
     builder: (_){
        return Scaffold(
          body: Column(children: [
            Header(),
             Row(

                            children: const[
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  'Signals Images',
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
                                   Container(height:MediaQuery.of(context).size.height*0.3,
                          width:MediaQuery.of(context).size.width*0.3,
                          decoration: BoxDecoration(
    border: Border.all(
      color: Colors.red,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(20))
  ),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    
    children:  [
    IconButton(onPressed: (){
      _.uploadProfile(context);

    }, icon: const Icon(Icons.add,color: Colors.black,size: 50,),),
    
  ],),
                          ),
                          // ignore: unnecessary_null_comparison
                          _.pictureController3 !=
                                                                    null &&
                                                                _.pictureController3 !=
                                                                    ''?  const InkWell(child: Text('Click to preview'),):Container(),
                               
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
                                       _.addSignalImage(context);
                                         
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