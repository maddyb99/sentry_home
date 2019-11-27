import 'package:flutter/material.dart';
import 'package:sentry_home/Authentication/LoginReq.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Authentication auth;
  GlobalKey<FormState> formkey;

  @override
  void initState() {
    super.initState();
    formkey = new GlobalKey();
    auth = new Authentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sentry home"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          validator: (string) {
                            if (string.isEmpty) return ("Enter Email");
                          },
                          onSaved: (str) => auth.getEmail(str),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          maxLines: 1,
                          validator: (string) {
                            if (string.isEmpty) return ("Enter Pass");
                          },
                          onSaved: (str) => auth.getPass(str),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          RaisedButton(
                            child: Text("Sign Up"),
                            onPressed: () => auth.SignUp(formkey, context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    auth.loginGoogle();
                  },
                  child: Row(
                    children: <Widget>[
//              Image.asset("google_logo.png"),
                      Text("Login with Google"),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
