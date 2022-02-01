import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiData {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  
  static CollectionReference admin = FirebaseFirestore.instance.collection("Admin");
  static CollectionReference users = FirebaseFirestore.instance.collection("Users");
 
  
}