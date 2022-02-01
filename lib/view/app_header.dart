import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_admin_chat_app/controllers/app_header_controller.dart';
import 'package:web_admin_chat_app/controllers/auth_controller.dart';
import 'package:web_admin_chat_app/widgets/app_buttons.dart';
import 'package:web_admin_chat_app/widgets/app_snackbar.dart';
import 'package:web_admin_chat_app/widgets/app_textfield.dart';




class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);
  PageController page = PageController(keepPage: false);
  
  final authController1 = Get.put(AuthController());
  final authController = Get.find<AuthController>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool validateAndSaveUser() {
    final form = formkey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<HeaderController>(
        init: HeaderController(),
        builder: (_) {
          return Container(
            padding: EdgeInsets.all(25),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          page.jumpToPage(10);
                        },
                        child: Row(
                          children: [
                            
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${_.firstName} ${_.lastName}',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  PopupMenuButton(
                    offset: Offset(0, 40),
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 20,
                      ),
                    ),
                    itemBuilder: (context) {
                      return List.generate(_.headerOptions.length, (index) {
                        return PopupMenuItem(
                          value: index,
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    _.logoutfun();
                                  },
                                  child: Icon(index == 1
                                      ? Icons.power_settings_new
                                      : Icons.change_circle)),
                              SizedBox(
                                width: 5,
                              ),
                              Text('${_.headerOptions[index]}'),
                            ],
                          ),
                        );
                      });
                    },
                    onSelected: (index) {
                      if (index == 0) {
                        // page.jumpToPage(9);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: Container(
                                  width: width * 0.4,
                                  child: Card(
                                    shadowColor: Colors.grey,
                                    elevation: 10,
                                    color: Colors.white,
                                    margin: EdgeInsets.zero,
                                    child: ListView(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      padding: EdgeInsets.all(15),
                                      children: [
                                        Image.asset(
                                          'assets/images/side_menu_logo.png',
                                          height: 70,
                                        ),
                                        Text(
                                          'changePassword',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.openSans(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 30),
                                        Form(
                                          key: formkey,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Column(
                                              children: [
                                                Obx(() {
                                                  return CommonTextFormField1(
                                                    passwordController,
                                                    'enterOldPassword',
                                                    'oldPassword',
                                                    _.obscureOldPassword.value,
                                                    TextInputType.name,
                                                    (value) {
                                                      return (value!.isEmpty)
                                                          ? 'oldPasswordCanNotBeEmpty'
                                                          : null;
                                                    },
                                                    showSuffix: true,
                                                    changeObscureStatus: () {
                                                      _.changeOldPassword();
                                                    },
                                                  );
                                                }),
                                                SizedBox(height: 30),
                                                Obx(() {
                                                  return Row(
                                                    children: [
                                                      Expanded(
                                                        child:
                                                            CommonTextFormField1(
                                                          newpasswordController,
                                                          'enterNewPassword',
                                                          'newPassword',
                                                          _.obscureNewPassword
                                                              .value,
                                                          TextInputType.name,
                                                          (value) {
                                                            // return PasswordValidationWidget
                                                            //     .validatePasswordOnPressed(
                                                            //         value);
                                                          },
                                                          showSuffix: true,
                                                          changeObscureStatus:
                                                              () {
                                                            _.changeNewPassword();
                                                          },
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          // PasswordValidationWidget
                                                          //     .showPasswordInfoDialog(
                                                          //         context);
                                                        },
                                                        icon: Icon(
                                                          Icons.info,
                                                          color: Colors.black54,
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                                SizedBox(height: 30),
                                                Obx(() {
                                                  return CommonTextFormField1(
                                                    confirmpasswordController,
                                                    'confirmNewPassword',
                                                    'confirmNewPassword',
                                                    _.obscureConfirmPassword
                                                        .value,
                                                    TextInputType.name,
                                                    (value) {
                                                      if (value.isEmpty) {
                                                        return 'confirmPasswordCannotBeEmpty';
                                                      }
                                                      if (value !=
                                                          newpasswordController
                                                              .text) {
                                                        return 'passwordNotMatch';
                                                      }
                                                      return null;
                                                    },
                                                    showSuffix: true,
                                                    changeObscureStatus: () {
                                                      _.changeConfirmPassword();
                                                    },
                                                  );
                                                }),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            // Container(
                                            //   alignment: Alignment.centerLeft,
                                            //   padding:
                                            //       const EdgeInsets.all(15.0),
                                            //   child: HealthGuage(),
                                            // ),
                                            CircularButtons(
                                              backgroundColor:
                                                  const Color(0xfffc6359),
                                              borderColor:
                                                  const Color(0xfffc6359),
                                              text: 'save',
                                              height: 50,
                                              width: Get.width >= 720
                                                  ? width * 0.2
                                                  : width * 0.4,
                                              onPressed: () {
                                                if (validateAndSaveUser()) {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    20.0),
                                                              ),
                                                            ),
                                                            backgroundColor:
                                                                Colors.white,
                                                            content: Container(
                                                              height: 200,
                                                              width: 400,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Do You Want To Update Password',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .blue,
                                                                            fontSize:
                                                                                25,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      CircularButtons(
                                                                        backgroundColor:
                                                                            const Color(0xff4F8484),
                                                                        borderColor:
                                                                            const Color(0xff4F8484),
                                                                        text:
                                                                            'yes',
                                                                        height:
                                                                            50,
                                                                        width: width *
                                                                            0.1,
                                                                        textColor:
                                                                            Colors.white,
                                                                        textStyle:
                                                                            TextStyle(),
                                                                        onPressed:
                                                                            () {
                                                                          authController.changePassword(
                                                                              passwordController.text,
                                                                              newpasswordController.text);
                                                                          formkey
                                                                              .currentState!
                                                                              .reset();
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                      ),
                                                                      CircularButtons(
                                                                        backgroundColor:
                                                                            const Color(0xfffc6359),
                                                                        borderColor:
                                                                            const Color(0xfffc6359),
                                                                        text:
                                                                            'no',
                                                                        height:
                                                                            50,
                                                                        width: width *
                                                                            0.1,
                                                                        textColor:
                                                                            Colors.white,
                                                                        textStyle:
                                                                            TextStyle(),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ));
                                                      });
                                                } else {
                                                  CustomAlertDialog.showAlertDialog(
                                                      title: 'warning',
                                                      message:
                                                          'pleaseFillAllFields',
                                                      backgroundColor:
                                                          Colors.white);
                                                }
                                              },
                                              textColor: Colors.white,
                                              textStyle: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else if (index == 1) {
                        _.logoutfun();
                      }
                    },
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                            radius: 45.0,
                            backgroundImage: _.pic.isEmpty
                                ? null
                                : MemoryImage(base64Decode(_.pic)),
                            child: _.pic.isEmpty
                                ? IconButton(
                                    onPressed: () {}, icon: Icon(Icons.person))
                                : null),
                      ),
                    ],
                  ),
                ],
              )
            ]),
          );
        });
  }
}
