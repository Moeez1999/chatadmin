import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_admin_chat_app/routes/app_pages.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  
 await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyA1YPdR84U8ErnyNskhvy7lwZ4NVBLXuV8',
      appId: '1:421460097778:web:f2ffd998f13aa78180ee6b',
      messagingSenderId: '421460097778',
      projectId: 'dominate-forex-app',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dominate Forex Admin Panel',
      initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
     
    );
  }
}


