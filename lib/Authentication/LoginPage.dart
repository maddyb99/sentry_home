import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    validator: (string){
                      if(string.isEmpty)
                        return ("Enter Email");
                    },
                    onSaved: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    maxLines: 1,
                    validator: (string){
                      if(string.isEmpty)
                        return ("Enter Email");
                    },
                    onSaved: null,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}