import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:web_admin_chat_app/controllers/login_controller.dart';
import 'package:web_admin_chat_app/utils/app_colors.dart';
import 'package:web_admin_chat_app/view/forget_password.dart';
import 'package:web_admin_chat_app/widgets/app_buttons.dart';
import 'package:web_admin_chat_app/widgets/app_textfield.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
      init: LogInController(),
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xffE5E5E5),
            body: Center(
              child: _.isLoading
                  ? SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: LoadingAnimationWidget.inkDrop(
                          color: AppColors.bluecolor,
                          size: 50,
                        ),
                      ),
                    )
                  : Container(
                      height: Get.height,
                      width: Get.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/bg.jpg'),
                              fit: BoxFit.cover)),
                      child: SingleChildScrollView(
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 10,
                          color: Colors.white,
                          child: Form(
                            key: _.formkey,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onLongPress: () {
                                    _.createAccount();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    // child: Image.asset('assets/header_image.svg'),
                                    child: Image.asset(
                                      'assets/images/side_menu_logo.png',
                                      height: 70,
                                    ),
                                  ),
                                ),
                                Text(
                                  'WELCOME TO Admin Panel',
                                  style: GoogleFonts.mochiyPopOne(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                Text(
                                  'Log In',
                                  style: GoogleFonts.mochiyPopOne(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 39),
                                  child: CommonTextFormField1(
                                    _.email,
                                    'Enter Email',
                                    'Email',
                                    false,
                                    TextInputType.name,
                                    (value) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      var regex = RegExp(pattern as String);
                                      return (!regex.hasMatch(value!))
                                          ? 'Please enter valid email'
                                          : null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 39),
                                  child: CommonTextFormField1(
                                    _.password,
                                    'Enter password',
                                    'Password',
                                    _.obscurePassword,
                                    TextInputType.name,
                                    (value) {
                                      return (value!.isEmpty)
                                          ? 'Password can not be empty'
                                          : null;
                                    },
                                    showSuffix: true,
                                    changeObscureStatus: () {
                                      _.changeObscurePassword();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Checkbox(
                                        value: _.rememberMe,
                                        onChanged: (bool? value) {
                                          _.rememberMe = value!;
                                          _.update();
                                        },
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('Remember me'),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(ResetPasswordDesktop());
                                        },
                                        child: const Text(
                                          'Forget Password',
                                          style: TextStyle(
                                              color: AppColors.redcolor),
                                        ),
                                      ).marginOnly(right: 30)
                                    ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularButtons(
                                      backgroundColor: const Color(0xfffc6359),
                                      borderColor: const Color(0xfffc6359),
                                      text: "Log In",
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      onPressed: () {
                                        _.getLogin();
                                      },
                                      textColor: Colors.white,
                                      textStyle: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ).marginSymmetric(horizontal: 360, vertical: 60),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
