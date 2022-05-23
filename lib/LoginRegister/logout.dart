import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';



class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

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
}