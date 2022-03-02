import 'dart:convert';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:web_admin_chat_app/controllers/add_signals_images_controller.dart';
import 'package:web_admin_chat_app/utils/app_colors.dart';
import 'package:web_admin_chat_app/view/app_header.dart';
import 'package:web_admin_chat_app/widgets/app_buttons.dart';
import 'package:web_admin_chat_app/widgets/app_dropdown.dart';

class AddSignalsImages extends StatelessWidget {
  const AddSignalsImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingalImagesController>(
      init: SingalImagesController(),
      builder: (_) {
        return Scaffold(
          body: _.isLoading
              ? Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: LoadingAnimationWidget.inkDrop(
                        color: AppColors.bluecolor,
                        size: 50,
                      ),
                    ),
                  ),
                )
              : Column(
                  children: [
                    Header(),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            'Signals Images',
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Add Singals Information',
                      style: GoogleFonts.mochiyPopOne(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        _.uploadImage();
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          child: _.pictureController.isNotEmpty
                              ? CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: MemoryImage(
                              base64Decode(
                                _.pictureController,
                              ),
                            ),
                            radius: 100,
                          )
                              : CircularProfileAvatar(
                            "https://cdn-icons.flaticon.com/png/128/2105/premium/2105556.png?token=exp=1634679429~hmac=6e6c5cd8d9993c8a015592efe6752f47",
                            borderColor: Colors.white,
                            backgroundColor: Colors.grey.shade50,
                            errorWidget: (context, url, error) =>const Icon(
                              Icons.add_a_photo,
                              color: Colors.grey,
                              size: 25.0,
                            ),
                            placeHolder: (context, url) =>const Icon(
                              Icons.add_a_photo,
                              color: Colors.grey,
                              size: 25.0,
                            ),
                            borderWidth: 5,
                            radius: 50.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: CommonDropDownField(
                        placeholder: "Role",
                        controller: _.selecttilte,
                        values: _.titlelist,
                        checkedvalue: _.selecttilte,
                        screenController: _,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularButtons(
                          backgroundColor: const Color(0xfffc6359),
                          borderColor: const Color(0xfffc6359),
                          text: "Add",
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.2,
                          onPressed: () async{
                            await _.addData();
                          },
                          textColor: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}
