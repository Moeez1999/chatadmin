import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_admin_chat_app/controllers/update_account_controller.dart';
import 'package:web_admin_chat_app/utils/app_colors.dart';
import 'package:web_admin_chat_app/widgets/app_buttons.dart';
import 'package:web_admin_chat_app/widgets/app_snackbar.dart';
import 'package:web_admin_chat_app/widgets/app_textfield.dart';



class UpdateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateAccountController>(
      init: UpdateAccountController(),
      builder: (_) {
        return _.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Scaffold(
                  backgroundColor: AppColors.backgroundcolor,
                  body: Center(
                    child: _.isLoading
                        ? CircularProgressIndicator()
                        : Container(
                          height: Get.height,
                          width: Get.width * 0.4,
                          child: SingleChildScrollView(
                            child: Card(
                              shadowColor: Colors.grey,
                              elevation: 10,
                              color: Colors.white,
                              child: Form(
                                key: _.formkey,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 35),
                                      child: Image.asset(
                                          "assets/images/side_menu_logo.png"),
                                    ),
                                    Text("Update Account",
                                        style: GoogleFonts.mochiyPopOne(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: Get.width / 3.0,
                                            child: Center(
                                              child: Stack(
                                                alignment:
                                                    Alignment.topRight,
                                                children: [
                                                  Container(
                                                    height: 150,
                                                    width: 150,
                                                    decoration:
                                                        BoxDecoration(
                                                      shape:
                                                          BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.blue,
                                                        width: 4,
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.grey,
                                                        backgroundImage:
                                                            _.pictureController3 !=
                                                                        null &&
                                                                    _.pictureController3 !=
                                                                        ''
                                                                ? MemoryImage(
                                                                    base64Decode(
                                                                      _.pictureController3,
                                                                    ),
                                                                  )
                                                                : null,
                                                        radius:
                                                            Get.width / 8.5,
                                                        child: _.pictureController3 !=
                                                                    null &&
                                                                _.pictureController3 !=
                                                                    ''
                                                            ? null
                                                            : Icon(
                                                                Icons
                                                                    .perm_identity,
                                                                color: Colors
                                                                    .white,
                                                                size: 50,
                                                              ),
                                                      ),
                                                      onTap: () {
                                                        _.uploadProfile(
                                                            context);
                                                      },
                                                    ),
                                                  ),
                                                  InkWell(
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration:
                                                          BoxDecoration(
                                                        shape:
                                                            BoxShape.circle,
                                                        border: Border.all(
                                                          color:
                                                              Colors.blue,
                                                          width: 2,
                                                        ),
                                                        color: Colors.white,
                                                      ),
                                                      child: Icon(
                                                          Icons.edit,
                                                          size: 20),
                                                    ).paddingOnly(
                                                        right: 0, top: 0),
                                                    onTap: () {
                                                      _.uploadProfile(
                                                          context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 39),
                                      child: CommonTextFormField1(
                                        _.fNameController,
                                        'Enter first name',
                                        'First Name',
                                        false,
                                        TextInputType.name,
                                        (value) {
                                          return (value!.trim().isEmpty)
                                              ? "First Name can't be Empty"
                                              : null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 39),
                                      child: CommonTextFormField1(
                                        _.lNameController,
                                        'Enter last name',
                                        'Last Name',
                                        false,
                                        TextInputType.name,
                                        (value) {
                                          return (value!.trim().isEmpty)
                                              ? "Last Name can't be Empty"
                                              : null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 39),
                                      child: CommonTextFormField1(
                                        _.emailController,
                                        'Email',
                                        'Email',
                                        false,
                                        TextInputType.name,
                                        (value) {
                                          return (value!.isEmpty)
                                              ? "Email can't be Empty"
                                              : null;
                                        },
                                        readOnly: true,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              CircularButtons(
                                                  backgroundColor:
                                                      const Color(
                                                          0xfffc6359),
                                                  borderColor: const Color(
                                                      0xfffc6359),
                                                  text: "Save",
                                                  height: 50,
                                                  width: Get.width * 0.2,
                                                  textColor: Colors.white,
                                                  textStyle: TextStyle(),
                                                  onPressed: () {
                                                    if (_
                                                        .validateAndSaveUser()) {
                                                      showDialog(
                                                          context: context,
                                                          builder:
                                                              (BuildContext
                                                                  context) {
                                                            return AlertDialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            20.0))),
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                content:
                                                                    Container(
                                                                  height:
                                                                      200,
                                                                  width:
                                                                      400,
                                                                  child:
                                                                      Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Do you want to update account',
                                                                            style: TextStyle(
                                                                                // color:
                                                                                // fButtonColor,
                                                                                fontSize: 25,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          CircularButtons(
                                                                            backgroundColor: const Color(0xff4F8484),
                                                                            borderColor: const Color(0xff4F8484),
                                                                            text: "Yes",
                                                                            height: 50,
                                                                            width: Get.width * 0.1,
                                                                            textColor: Colors.white,
                                                                            textStyle: TextStyle(),
                                                                            onPressed: () async {
                                                                              _.addProfile(context);
                                                                            },
                                                                          ),
                                                                          CircularButtons(
                                                                            backgroundColor: const Color(0xfffc6359),
                                                                            borderColor: const Color(0xfffc6359),
                                                                            text: "No",
                                                                            height: 50,
                                                                            width: Get.width * 0.1,
                                                                            textColor: Colors.white,
                                                                            textStyle: TextStyle(),
                                                                            onPressed: () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ));
                                                          });
                                                    } else {
                                                      CustomAlertDialog
                                                          .showAlertDialog(
                                                              title:
                                                                  "Warning",
                                                              message:
                                                                  "Please Fill all fields",
                                                              backgroundColor:
                                                                  Colors
                                                                      .white);
                                                    }
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
              );
      },
    );
  }
}
