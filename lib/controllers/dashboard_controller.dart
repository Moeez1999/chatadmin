
// ignore_for_file: unnecessary_overrides

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_admin_chat_app/apis/api_data.dart';
import 'package:web_admin_chat_app/widgets/app_snackbar.dart';

class DashBoardController extends GetxController{

  bool isLoading = true;

  List adminList = [];
  List usersList = [];
  List titleList = [];
 


  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    await getadminData();
    await getuserData();
    await gettitleData();
    
    isLoading = false;
    update();
    super.onReady();
    // ignore: avoid_print
    print("Not deleted");
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }

  Future<void> getadminData() async {
    try {
      adminList.clear();
      var data = await ApiData.admin.get();
      data.docs.forEach((v) {
        adminList.add(v.data());
      });
      update();
    } on FirebaseException catch (e) {
      CommonSnackbar.getSnackbar('Error', e.message.toString(), Colors.red);
    }
  }

  Future<void> getuserData() async {
    try {
      usersList.clear();
      var data = await ApiData.users.get();
      // ignore: avoid_function_literals_in_foreach_calls
      data.docs.forEach((v) {
        usersList.add(v.data());
      });
      update();
    } on FirebaseException catch (e) {
      CommonSnackbar.getSnackbar('Error', e.message.toString(), Colors.red);
    }
  }


  Future<void> gettitleData() async {
    try {
      titleList.clear();
      var data = await ApiData.title.get();
      // ignore: avoid_function_literals_in_foreach_calls
      data.docs.forEach((v) {
        titleList.add(v.data());
      });
      update();
    } on FirebaseException catch (e) {
      CommonSnackbar.getSnackbar('Error', e.message.toString(), Colors.red);
    }
  }


 

  

}