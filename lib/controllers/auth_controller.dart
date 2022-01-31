
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_admin_chat_app/view/login.dart';
import 'package:web_admin_chat_app/widgets/app_snackbar.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firebaseUser = FirebaseAuth.instance.currentUser.obs;
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    // BINDING AUTH LISTENER
    //firebaseUser.bindStream(_auth.authStateChanges());
  }

  // CHECKING DUPLICATE EMAIL
  Future<List<String>> checkDuplicateEmail(String email) async {
    try {
      return await _auth.fetchSignInMethodsForEmail(email);
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  //  CREATE USER WITH EMAIL AND PASSWORD

  // Login with email and password

  // LOGOUT
  /*void logOut() async {
    try {
      await _auth.signOut();
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('uid');
      Get.offAll(() => Login());
    } catch (e) {
      LoggingService().warning('Logout User Exception', e.toString());
      // CustomSnackBar.showSnackBar(
      //     title: e.toString(), message: '', backgroundColor: snackBarError);
      CustomAlertDialog.showAlertDialog(
          title: "Warning",
          message: "Invalid Password or Email",
          backgroundColor: Colors.white);
    }
  }*/
  void changePassword(String currentPassword, String newPassword) async {
    final cred = EmailAuthProvider.credential(
        email: _auth.currentUser!.email!, password: currentPassword);

    _auth.currentUser!.reauthenticateWithCredential(cred).then((value) {
      _auth.currentUser!.updatePassword(newPassword).then((_) {
        CustomSnackBar.showSnackBar(
            title: 'successPasswordUpdated',
            message: '',
            backgroundColor: Colors.green);
        logoutfun();
      }).catchError((error) {
        //LoggingService().warning('Update Password Exception', error.toString());
        // CustomSnackBar.showSnackBar(
        //     title:
        //     'Error Occurred',
        //     message: '',
        //     backgroundColor:
        //     snackBarError);
        CustomAlertDialog.showAlertDialog(
            title: 'warning',
            message: 'SomeThing Went Wrong',
            backgroundColor: Colors.white);
      });
    }).catchError((err) {
      // LoggingService().warning('Re authentication Exception', err.toString());
      CustomAlertDialog.showAlertDialog(
          title: 'warning',
          message: 'errorOccurred',
          backgroundColor: Colors.white);
    });
  }

  void saveUserState(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', uid);
  }

  Future getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }

  Future<void> logoutfun() async {
    // await LoggingService().firebaseLogEvent(FirebaseLoggingServiceRecord(
    //     logId: LoggingConstant.userLoggedOutFromSystem));
    await FirebaseAuth.instance.signOut().then((value) async {
      await storage.remove('username');
      await storage.remove('password');
      Get.offAll(() => Login());
    });
  }
}
