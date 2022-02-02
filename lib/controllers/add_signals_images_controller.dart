// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:web_admin_chat_app/apis/api_data.dart';
import 'package:web_admin_chat_app/widgets/app_snackbar.dart';

class SingalImagesController extends GetxController{
   String pictureController3 = "";
bool isLoading=false;
  FilePickerResult? uploadPhoto;
int maxFileSize = 500 * 1024; // in bytes 500 kb
  int signatureFileSize = 100 * 1024;
   var timestamp;
  
  // ignore: prefer_typing_uninitialized_variables
  var titlelist;
  var date;
  final signaldb = FirebaseFirestore.instance.collection("Title");
  static Future<List<int>?> checkFileSize(
      int size, BuildContext context, Uint8List file) async {
    
    return Future.value(file);
  } 
   uploadProfile(BuildContext context) async {
    uploadPhoto = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);
    if (uploadPhoto != null) {
      int size = uploadPhoto!.files.single.size;
      if (size == 0) {
        showSnackBar(size, maxFileSize);
      } else {
        final data = await checkFileSize(
            size, context, uploadPhoto!.files.single.bytes!);
        if (data != null) {
          pictureController3 = base64Encode(data);
          print(pictureController3);
          update();
        }
      }
    }
   


   }
   
     void showSnackBar(int size, int maxSize) {
    if (size == 0) {
    
      CustomAlertDialog.showAlertDialog(
          title: "Warning",
          message: "File Size cannot be zero",
          backgroundColor: Colors.white);
    } else {
     
      CustomAlertDialog.showAlertDialog(
          title: "Warning",
          message: "Image must be less than ${maxSize / (1024)} kB",
          backgroundColor: Colors.white);
    }
  }
  Future getDate() async {
    DateTime now = DateTime.now();
    String _d = DateFormat('dd MMMM yy').format(now);
    String _t = DateFormat('HHmmss').format(now);
          timestamp = _t;
      date = _d;
    update();
    
  }

  Future<void> addSignalImage(BuildContext context) async {
     var data = ApiData.title.doc();
    var docSnap = await data.get();
    Get.back();
    // WaitDialog.progressDialog(true, context);
  getDate();
    isLoading = true;
    update();
    await signaldb.doc( docSnap.reference.id).collection('Signals').doc( docSnap.reference.id).
    set({
      'docid': docSnap.reference.id ,
       'date': date,
      'timestamp' : timestamp,
      
      
      "imageUrl": pictureController3,
    }).then((value) async {
     
      isLoading = false;
      update();
      CustomSnackBar.showSnackBar(
        title: "Success",
        message: 'Image Added Successfully',
        backgroundColor: Colors.green,
      );
      // WaitDialog.progressDialog(false, context);
    });
  }
   }