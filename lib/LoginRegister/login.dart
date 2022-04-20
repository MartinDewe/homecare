import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:perawat_app/LoginRegister/otplogin.dart';


FirebaseAuth _auth = FirebaseAuth.instance;
final inputankontroler = TextEditingController();


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {

  final users = FirebaseFirestore.instance.collection('users');
  bool pesantampil = false;
  bool loadingcontrol = false;
  bool logedin = false;
  String pesanerror = 'Masukan nomor HP yang valid ya (9-13 angka).';


  @override
  
  Widget build(BuildContext context) {
   
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    
    return MaterialApp(
      home: Stack(
        children: [
         Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => 
              Navigator.of(context).pop(),
             ), 
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
            children:  [
               Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Image(
                    image: const AssetImage('assets/chibiperawat2.png'),
                    width: mediawidth * 0.6,
                    height: mediaheight * 0.2,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: mediawidth * 0.1, right: mediawidth * 0.05),
                child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold, 
                        fontSize: 24, ),
                        text: 'Masukan no. HP Anda yang sudah terdaftar'
                    ),
                )
              ),
               Container(
                margin: EdgeInsets.only(top:15,left: mediawidth * 0.1, right:  mediawidth * 0.1),
                child: Row(
                  children: [
                    Container(
                     decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                      ),
                     margin: const EdgeInsets.only(right: 5,top:5),
                     child: const Image(
                       image: AssetImage('assets/indoicon.png'),)
                     ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: const Text('(+62 )',
                        style: TextStyle( 
                          fontWeight: FontWeight.bold, 
                        ),
                      )
                    ),
                    Expanded(
                      child: TextField(
                        
                        controller: inputankontroler,
                        onChanged: (content){
                          setState(() {
                            pesantampil = false;
                          });
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Contoh: 851234xxx',
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          isDense: true,      
                        ),
                      ),
                    ),
                   
                  ],
                ),
              ),
            
               Row(
                children: [
               Padding(
                 padding: const EdgeInsets.only(left: 33, top:15),
                 child: Visibility(
                   visible: pesantampil,
                   child:  Text(
                     pesanerror,
                     style: const TextStyle( 
                       color: Colors.redAccent
                     ),
                   ),
                 ),
               )
                ],
              ),
              
            ],
              ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: mediawidth * 0.85,
              child: ElevatedButton(
                onPressed:() async {
                
                  try{
                   await users.doc('+62' + inputankontroler.text).get().then((value) {
                   var dats = value.data();
                   if(dats == null){
                      setState(() {
                       logedin = false;
                     });
                   } else{
                     setState(() {
                       logedin = true;
                     });
                   }
                  });} on Exception {
              
                    setState(() {
                        pesanerror = 'Request Timeout.';
                        pesantampil = true;
                    });
               
                  }
                    if (inputankontroler.text.isEmpty || inputankontroler.text.length <= 8 || inputankontroler.text.length >= 14) {
                      setState(() {
                      pesanerror = 'Masukan nomor HP yang valid ya (9-13 angka).';
                      loadingcontrol = false;
                      pesantampil = true;
                    });
                  } else if(logedin == true) {
                      setState(() {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      loadingcontrol = true;
                      });
                      try{
                        await _auth.verifyPhoneNumber(
                        phoneNumber: '+62' + inputankontroler.text, 
                        verificationCompleted: (phoneAuthCredential) async{}, 
                        verificationFailed: (verificationFailed) async{
                          setState(() {
                            loadingcontrol = false;
                            pesanerror = 'Terjadi Kesalahan, Coba beberapa saat.';
                            pesantampil = true;
                          });
                        }, 
                        codeSent: (verificationId, resendingToken) async{
                          setState(() {
                            loadingcontrol = false;
                            
                          });
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Otplogin(verificationIds: verificationId, phonenumber: '+62' + inputankontroler.text) ),
                          );
          
                        }, 
                        codeAutoRetrievalTimeout: (verificationId) async{
                          setState(() {
                            loadingcontrol = false;
                            pesanerror = 'Request Timeout.';
                            pesantampil = true;
                            });
                        },
                        );
                      } on Exception {
                        setState(() {
                            pesanerror = 'Request Timeout.';
                            pesantampil = true;
                        });

                      }
                  } else {
                    setState(() {
                    pesanerror = 'Nomor HP belum terdaftar.';
                    loadingcontrol = false;
                    pesantampil = true;
                  });
                  }
                }, 
                child: const Text("Masuk",
                  style: TextStyle(
                    color: Colors.black, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 16, ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xfff76992),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ),
        loadingcontrol? loadingcontent(mediawidth, mediaheight) : navbarcolor()
        ]
      ),
      
    );

  }
  
  navbarcolor(){
    return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.white,
    ),
    child: const Center()
    );
  }

  loadingcontent(mediawidth, mediaheight){
   
  
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.black87,
    ),
    child: BackdropFilter(
    filter: ImageFilter.blur(
      sigmaX: 3 ,
      sigmaY: 3,
    ),
    child: Container(
      width: mediawidth,
      height: mediaheight,
      color: Colors.black87,
      child: Lottie.asset(
        'assets/paperplane.json'
      ),
    ),
  )
  );
}
}
