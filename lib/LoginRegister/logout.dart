import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:perawat_app/LoginRegister/landing.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
@override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  
  Widget build(BuildContext context) {
      final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: mediawidth,
          height: mediaheight,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(top: mediaheight*0.15),
            child: Column(
              children: [
                Lottie.asset('assets/log-out.json'),
                Text(
                  'Sedang Logout . . .',
                  style: GoogleFonts.poppins(
                          color: Colors.cyan[600],
                          fontWeight: FontWeight.w400, 
                          fontSize: mediaheight*0.035,
                        ), 
                )
                ]),
          ),
        ),
            ),
            
      );
    
    
  }

  startTimer() async {
    Future.delayed(const Duration(seconds: 3) ,() {
    _auth.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Landing() ),
      (Route<dynamic> route) => false
    );
  });
  }
}