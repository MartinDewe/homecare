import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
      body:  Center(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image(
                    image: const AssetImage('assets/LogoLanding.png'),
                    width: mediawidth * 0.85,
                    height: mediaheight * 0.6,
                    ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: mediawidth * 0.85,
                height: mediaheight * 0.04,
                alignment: Alignment.centerLeft,
                child: const Text('Hanya Untukmu',
                  style: TextStyle(
                    color: Colors.black26, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 16, ),
                ),
              ),
              Container(
                width: mediawidth * 0.85,
                height: mediaheight * 0.15,
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold, 
                      fontSize: 32, ),
                      text: 'Kami siap membantu anda untuk urusan keperawatan.\n'
                  ),
                  ),
              ),
              Container(
                width: mediawidth * 0.85,
                height: mediaheight * 0.1,
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.centerLeft,
                child: Row(  
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: mediawidth*0.05,),
                      child: ElevatedButton(
                        onPressed: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Register() ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFffea66),
                          minimumSize:  Size(mediawidth*0.35, mediaheight*0.05),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("Daftar",
                          style: TextStyle(
                            color: Colors.black, 
                            fontWeight: FontWeight.bold, 
                            fontSize: 16, ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: mediawidth*0.05,),
                      child: ElevatedButton(
                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Login() ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFffea66),
                          minimumSize: Size(mediawidth*0.35, mediaheight*0.05),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("Masuk",
                          style: TextStyle(
                                color: Colors.black, 
                                fontWeight: FontWeight.bold, 
                                fontSize: 16, ),
                         ),
                        ),
                    ),
                  ],
                ),
              ),
           
            ],
          ),
      ),
      
      )
      );
  }
}