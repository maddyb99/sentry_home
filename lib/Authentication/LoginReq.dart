import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sentry_home/Utils/GameData.dart';


class Authentication {

  FirebaseAuth _auth;
  GoogleSignIn googleSignIn;
  Map<String, dynamic> details;

  Authentication() {
    _auth = FirebaseAuth.instance;
    googleSignIn = GoogleSignIn();
    details = new Map();
    currentUser = new UserData();
  }

  void getEmail(String email) => details.addAll({"emailID": email});

  void getPass(String pass) => details.addAll({"pass": pass});

  void getName(String pass) => details.addAll({"name": pass});

  void getRegNo(String pass) => details.addAll({"regno": int.parse(pass)});

  void Login(GlobalKey<FormState> formkey, BuildContext context) async {
    FormState state = formkey.currentState;
    if (state.validate()) {
      state.save();
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: details["emailID"], password: details["pass"]);
      if (result.user != null) {
        currentUser.usr = result.user;
        currentUser.userData =
        await Firestore.instance.collection("Users").document(
            currentUser.usr.uid).get();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => ListPage(title: 'QUIZ IT'),
            ), ModalRoute.withName(':'));
      }
    }
  }

  void SignUp(GlobalKey<FormState> formkey, BuildContext context) async {
    FormState state = formkey.currentState;
    if (state.validate()) {
      state.save();
      print(details);
      try {
        AuthResult result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: details["emailID"], password: details["pass"]);
        print(result.toString());
      }
      catch (e) {
        print(e.toString());
      }
//
//      if(result.user!=null){
      print("in");
      currentUser.usr = await FirebaseAuth.instance.currentUser();
      if (currentUser.usr != null) {
        details.remove("pass");
        print(details);
        await Firestore.instance.collection("Users").document(
            currentUser.usr.uid).setData({
          'Name': details["name"],
          'emailID': details["emailID"],
          'RegNo': details["regno"]
        });
        currentUser.userData =
        await Firestore.instance.collection("Users").document(
            currentUser.usr.uid).get();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => ListPage(title: 'QUIZ IT'),
            ), ModalRoute.withName(':'));
      }
    }
  }

  loginGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }

  logOut() async {
    await googleSignIn.signOut();
  }
}
