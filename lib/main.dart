import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kioxkefinal/views/home.dart';
import 'package:kioxkefinal/views/login.dart';
import 'package:kioxkefinal/views/spash.dart';
import 'package:shared_preferences/shared_preferences.dart';



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
   
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
   Future<String> _email,_nome;
  startTimeout() {
    return new Timer(Duration(seconds: 2), handleTimeout);
  }
  
  Future<void> _checkSession(String nome,String email) async {
    final SharedPreferences prefs = await _prefs;
    //final int counter = (prefs.getInt('counter') ?? 0) + 1;
      if(prefs.getString("email") != null){
         print(prefs.getString("email")+prefs.getString("nome"));
         Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) =>  HomeView(nome,email)),(Route<dynamic> route) => false);
      }
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
    _email = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('email'));
    });
    _nome = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('nome'));
    });
     _checkSession(_nome.toString(),_email.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Splash(),
    );
  }
}
