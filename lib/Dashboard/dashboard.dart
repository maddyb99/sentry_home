import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool sentryMode;
  @override
  void initState(){
    super.initState();
    sentryMode=false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),),
      body: Column(
        children: <Widget>[
          Card(
            child: SwitchListTile(
                value: sentryMode,
//              groupValue: null,
                onChanged: (val){
                  setState(() {
                    sentryMode=val;
                  });
                },
              title: Text("Sentry Mode"),
            ),
          ),
          Card(
            child: Container(
              height: 100,
              child: Column(
                children: <Widget>[
                  Text("Status",style: TextStyle(fontSize: 24),),
                  Text("Sentry mod is "+(sentryMode?"engaged":"not engaged"))
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}