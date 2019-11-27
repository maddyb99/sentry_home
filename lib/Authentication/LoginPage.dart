import 'package:flutter/material.dart';
import 'package:sentry_home/Authentication/LoginReq.dart';
import 'package:sentry_home/Authentication/SignUpPage.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return Center(
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
                          if (string.isEmpty)
                            return ("Enter Email");
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
                          if (string.isEmpty)
                            return ("Enter Pass");
                        },
                        onSaved: (str) => auth.getPass(str),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text("Sign Up"),
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignUpPage())),
                        ),
                        RaisedButton(
                          child: Text("Login"),
                          onPressed: () => auth.Login(formkey, context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            FlatButton(onPressed: () {
              auth.loginGoogle();
            }, child: Row(
              children: <Widget>[
//              Image.asset("google_logo.png"),
                Text("Login with Google"),
              ],
            )),
          ],
        ),
      ),
    );
  }
}