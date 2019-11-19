import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  FirebaseUser usr;
  DocumentSnapshot userData;
//  UserData(FirebaseUser u,DocumentSnapshot s){
//    usr=u;
//    userData=s;
//  }
}

UserData currentUser;
