
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_admin_chat_app/apis/api_data.dart';
import 'package:web_admin_chat_app/widgets/app_snackbar.dart';

class DashBoardController extends GetxController{

  bool isLoading = true;

  List adminList = [];
  List usersList = [];
 


  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    await getadminData();
    await getuserData();
    
    isLoading = false;
    update();
    super.onReady();
    print("Not deleted");
  }

  @override
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
      data.docs.forEach((v) {
        usersList.add(v.data());
      });
      update();
    } on FirebaseException catch (e) {
      CommonSnackbar.getSnackbar('Error', e.message.toString(), Colors.red);
    }
  }


 

  int sumTwo(List < int > numbers) {
    int sum = 0;
    for (var i in numbers) {
      sum = sum + i;
    }
    return sum;
  }

}