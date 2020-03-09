import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('DashBoard'),
          ),
          body: Column(
            children: <Widget>[
              Image.asset('images/bytebank_logo.png'),
              Container(
                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    Icon(Icons.people),
                    Text('Contacts')
                  ],
                ),
              )
            ],
          )),
    );
  }
}
