import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kioxkefinal/views/login.dart';
import 'package:kioxkefinal/views/spash.dart';



void main (){
  runApp(
   MaterialApp(
      home:Main()
    )
  );
}


class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}


class _MainState extends State<Main> {

  startTimeout() {
    return new Timer(Duration(seconds: 2), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Splash(),
    );
  }
}
