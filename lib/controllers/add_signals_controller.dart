import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_admin_chat_app/apis/api_data.dart';
import 'package:web_admin_chat_app/widgets/app_snackbar.dart';

class AddSignalsController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool uploadStarted = false;

  @override
  void onReady() async {
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> addData() async {
    isLoading = true;
    update();
    try {
      var data = ApiData.title.doc();
      var docSnap = await data.get();
      data.set({
        'id': docSnap.reference.id,
        'name': title.text,
        'des': subtitle.text,
        'createdAt' : DateTime.now()
      }).then((value) {
        title.clear();
        subtitle.clear();
        isLoading = false;
        update();
        CommonSnackbar.getSnackbar(
          'Success',
          'Title added successfully',
          Colors.green,
        );
      });
    } on FirebaseException catch (e) {
      isLoading = false;
      update();
      CommonSnackbar.getSnackbar('Error', e.message.toString(), Colors.red);
    }
  }


}
