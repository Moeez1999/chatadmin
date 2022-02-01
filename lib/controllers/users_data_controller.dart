import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_admin_chat_app/apis/api_data.dart';
import 'package:web_admin_chat_app/widgets/app_snackbar.dart';

class NonCorporateAccountController extends GetxController {
  bool isLoading = true;
  List userlist = [];
  List searchlist = [];

  TextEditingController search = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    await getData();
    isLoading = false;
    update();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  searchFunction(String v) {
    searchlist = [];
    userlist.forEach((e) {
      if (e['email'].toString().toLowerCase().contains(v.toLowerCase())) {
        searchlist.add(e);
      }
       else if (e['username'].toString().toLowerCase().contains(v.toLowerCase())) {
        searchlist.add(e);
      }
       else if (e['id'].toString().toLowerCase().contains(v.toLowerCase())) {
        searchlist.add(e);
      }
      
      update();
    });
  }

  Future<void> getData() async {
    try {
      searchlist.clear();
      userlist.clear();
      var data = await ApiData.users.get();
      data.docs.forEach((v) {
        userlist.add(v.data());
      });
      update();

   
    } on FirebaseException catch (e) {
      CommonSnackbar.getSnackbar('Error', e.message.toString(), Colors.red);
    }
  }


  Future<void> updateuser(String id) async {
    await ApiData.users
        .doc(id)
        .update({'username': firstname.text, 'email': email.text}).then(
            (value) async {
          isLoading = true;
          update();
          await getData();
          isLoading = false;
          update();
          CommonSnackbar.getSnackbar(
              'Success', 'Data Delete Successfully', Colors.green);
        });
  }


  void deletenonCorporate(String id) {
    ApiData.users.doc(id).delete().then((value) async {
      isLoading = true;
      update();
      await getData();
      isLoading = false;
      update();
      CommonSnackbar.getSnackbar(
          'Success', 'Data Delete Successfully', Colors.green);
    });
  }
}
