
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_admin_chat_app/widgets/app_buttons.dart';
import 'package:web_admin_chat_app/widgets/app_textfield.dart';

class ResetPasswordDesktop extends StatefulWidget {
  @override
  _ResetPasswordDesktopState createState() => _ResetPasswordDesktopState();
}

class _ResetPasswordDesktopState extends State<ResetPasswordDesktop> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  //final authController = Get.find<AuthController>();
  final emailController = TextEditingController();
  late String _email;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void validate() {
    if (formkey.currentState!.validate()) {
      debugPrint("Validated");
    } else {
      debugPrint("object");
    }
  }

  bool validateAndSave() {
    final form = formkey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  _validateAndSubmitSignIn(context) async {
    if (validateAndSave()) {
    } else {
      debugPrint("Please fill all fields".toUpperCase());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        body: Container(
          height: Get.height,
          width: Get.width,
           decoration: const BoxDecoration(image:DecorationImage(image: AssetImage('assets/images/bg.jpg'),fit: BoxFit.cover)),
          child: Center(
            child: SizedBox(
              height: height * 0.75,
              width: width * 0.4,
              child: SingleChildScrollView(
                child: Card(
                  shadowColor: Colors.grey,
                  elevation: 10,
                  color: Colors.white,
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Image.asset(
                            'assets/images/side_menu_logo.png',
                            height: 70,
                          ),
                        ),
                        Text(
                          "Reset Password",
                          style: GoogleFonts.mochiyPopOne(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "A link will be sent to your email address from where you can reset your password",
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 39),
                          child: CommonTextFormField1(
                            emailController,
                            'Enter email',
                            'Email',
                            false,
                            TextInputType.name,
                            (value) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern as String);
                              return (!regex.hasMatch(value!))
                                  ? "Please Enter Valid Email"
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
        
                        //   height: 5,
                        // ),
        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularButtons(
                              backgroundColor: const Color(0xfffc6359),
                              borderColor: const Color(0xfffc6359),
                              text: "Send Link",
                              height: 50,
                              width: width * 0.2,
                              onPressed: () {
                                setState(() {
                                  if (validateAndSave()) {
                                    _firebaseAuth.sendPasswordResetEmail(
                                      email: emailController.text,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: const Text(
                                          "The reset link has been sent to email provided"),
                                      duration: Duration(seconds: 5),
                                    ));
                                    Get.back();
                                  } else {}
                                  print("object");
                                });
                              },
                              textColor: Colors.white,
                              textStyle: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
        
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
