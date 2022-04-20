import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perawat_app/LoginRegister/landing.dart';
import 'package:perawat_app/home.dart';


FirebaseAuth _auth = FirebaseAuth.instance;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState(){
    return _Splash();
  }
}

class _Splash extends State<Splash> {

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    Future.delayed(const Duration(seconds: 4) ,() {
    route();
  });
  }

  route() {
    if(_auth.currentUser != null){
      Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => const HomePage()
      ));
    } else{
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => const Landing()
      ));
    }
  }

  @override
  Widget build(BuildContext context) {

    return  const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage('assets/homecare.png'),
          width: 190,
          
          ),
      ),

    ))
    ;
}
}