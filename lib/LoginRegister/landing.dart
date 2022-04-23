import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:perawat_app/LoginRegister/login.dart';
import 'package:perawat_app/LoginRegister/register.dart';


class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;

    return MaterialApp(
    home: Scaffold(   
      backgroundColor: Colors.yellow[200],
      body:  ListView(
        children: <Widget> [
        Column(
        children: [ 
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: mediaheight*0.15),
              child: Text(
                  'Perawat',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w500, 
                    fontSize: 32,
                  ), 
                ),
            ),
          ),
      
           Center(
            child: Text(
                'Cukup Dirumah Saja!!',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w200, 
                  fontSize: 20,
                ), 
              ),
          ),
      
          const Center(
            child:  Padding(
              padding:  EdgeInsets.only(top:20),
              child:  Expanded(
                child: Image(
                    image: AssetImage('assets/mascot.png'),
                  ),
              ),
              ),
            ),
      
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login() ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top:35),
                width: mediawidth*0.7,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.verified_user_sharp,
                      color: Colors.teal[400],
                    ),
              
                    Padding(
                      padding: const EdgeInsets.only(left:10),
                      child: Text(
                        'Masuk',
                          style: GoogleFonts.karla(
                          color: Colors.black,
                          fontWeight: FontWeight.w400, 
                          fontSize: 24,
                        ), 
                   ),
                    )
                  ]
                ),
              ),
            ),
      
            GestureDetector(
              onTap: (){
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Register() ),
                );  
              },
              child: Container(
                margin: const EdgeInsets.only(top:15),
                width: mediawidth*0.7,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.pink[200],
                  ),
              
                  Padding(
                    padding: const EdgeInsets.only(left:10),
                    child: Text(
                      'Daftar',
                        style: GoogleFonts.karla(
                        color: Colors.white,
                        fontWeight: FontWeight.w200, 
                        fontSize: 24,
                      ), 
                  ),
                  )
                ]
              ),
              ),
            )
        ]
          ),
      ]
      ),
      
      )
      );
  }
}