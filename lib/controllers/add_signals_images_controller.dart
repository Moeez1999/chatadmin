
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:web_admin_chat_app/apis/api_data.dart';
import 'package:web_admin_chat_app/widgets/app_snackbar.dart';


class SingalImagesController extends GetxController {

  String pictureController3 = "";
  bool isLoading = true;
  FilePickerResult? uploadPhoto;
  int maxFileSize = 500 * 1024;
  int signatureFileSize = 100 * 1024;

  List titlelist = [];

  TextEditingController selecttilte = TextEditingController();


  final picker = ImagePicker();
  PickedFile? pickedFile;
  XFile? xFile;
  String attachmentBase64Image = "";
  String attachmentFileName = "";
  String attachmentType = '';
  String retrieveDataError = "";
  String pictureController = "";

  String docId = '';

  dynamic pickImageError;


  @override
  void onReady() async{
    await getTitles();
    isLoading = false;
    update();
    super.onReady();
  }


  Future<void> getTitles()async
  {
    titlelist.clear();
    titlelist.add({'id': '0', 'name': 'Select Title'});
    update();
    var data = await ApiData.title.get();
    for (var e in data.docs) {
      titlelist.add({'id': e.get('id'), 'name': e.get('name')},);
    }
    update();
  }


  uploadImage() async {
    try {
      xFile = (await picker.pickImage(
        source: ImageSource.gallery,
      ))!;
    } catch (e) {
      pickImageError = e;
    }

    if (GetPlatform.isAndroid) await retrieveLostData();
    if (kDebugMode) {
      print("Check $xFile");
    }
    if (xFile!.path.isNotEmpty) {
      attachmentBase64Image = base64Encode(await xFile!.readAsBytes());
      attachmentFileName = xFile!.path.split("/").last;
      if (attachmentBase64Image != "") {
        pictureController = attachmentBase64Image;
        attachmentType = 'local';
        update();
      }
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      xFile = response.file!;
    } else {
      retrieveDataError = response.exception!.code;
    }
  }


  Future<void> addData() async {
    isLoading = true;
    update();
    try {
      var data = ApiData.signals.doc();
      var docSnap = await data.get();
      data.set({
        'id': docSnap.reference.id,
        'titleId': selecttilte.text,
        'imagePath': pictureController,
        'createdAt' : DateTime.now()
      }).then((value) {
        isLoading = false;
        update();
        CommonSnackbar.getSnackbar(
          'Success',
          'Signal added successfully',
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
