import 'package:flutter/material.dart';
import 'package:sentry_home/Authentication/LoginReq.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Authentication auth = new Authentication();

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
                RaisedButton(
                  child: Text("Login"),
                  onPressed: null,
                )
              ],
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
    );
  }
}