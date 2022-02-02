import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:web_admin_chat_app/apis/api_data.dart';
import 'package:web_admin_chat_app/widgets/app_snackbar.dart';

class AddSignalsController extends GetxController{
   final FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading=false;
   bool uploadStarted = false;
   // ignore: prefer_typing_uninitialized_variables
   var timestamp;
  
  // ignore: prefer_typing_uninitialized_variables
  var titlelist;
  var date;
 @override
  void onReady() async {
   
    isLoading = false;
    update();
    super.onReady();

  }

  @override
  void onClose() {
    super.onClose();
  }

   Future saveToDatabase() async {
     var data = ApiData.title.doc();
    var docSnap = await data.get();
    final DocumentReference ref = firestore.collection('Title').doc( docSnap.reference.id,);
    titlelist = {
      'title' : title.text,
      'description' : subtitle.text,
      'docid': docSnap.reference.id,
       'date': date,
      'timestamp' : timestamp
      
      
    };
    await ref.set(titlelist);
  }


  Future getDate() async {
    DateTime now = DateTime.now();
    String _d = DateFormat('dd MMMM yy').format(now);
    String _t = DateFormat('HHmmss').format(now);
          timestamp = _t;
      date = _d;
    update();
    
  }
bool validateAndSaveUser() {
    final form = formKey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void handleSubmit() async {
    
      
     
         uploadStarted = true;
         update();
        await getDate().then((_) async{
          await saveToDatabase();
          
           uploadStarted = false;
           update();
          CustomSnackBar.showSnackBar(title: "success",message: "Added",backgroundColor: Colors.green);
          
          
          
        });
      
    }
    
  }

