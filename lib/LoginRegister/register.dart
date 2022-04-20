import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:perawat_app/LoginRegister/otpdaftar.dart';

final inputankontroler = TextEditingController();
FirebaseAuth _auth = FirebaseAuth.instance;

enum androidvertifikasi{
  stateandroid,
  stateotp
}


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);


  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  androidvertifikasi currentstate = androidvertifikasi.stateandroid;
  
  final users = FirebaseFirestore.instance.collection('users');
  bool pesantampil = false;
  bool loadingcontrol = false;
  bool registered = false;
  String pesanerror = 'Masukan nomor HP yang valid ya (9-13 angka).';
  String passnumber = '';

  @override
  
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
   
    return  MaterialApp(
      home: Stack(
        children: [
          Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => 
              Navigator.of(context).pop(),
             ), 
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Center(
            child: Column(
              children: [
                Lottie.asset(
                 'assets/register-icon.json',
                 height: mediaheight*0.25
               ),
                Container(
                  margin: EdgeInsets.only( left: mediawidth * 0.1, right: mediawidth * 0.05),
                  child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold, 
                          fontSize: 24, ),
                          text: 'Masukan no. HP yang akan Anda daftarkan'
                      ),
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top:15,left: mediawidth * 0.1, right: mediawidth * 0.1),
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
                
                onPressed: () async {
                 try{
                  await users.doc('+62' + inputankontroler.text).get().then((value) {
                   var dats = value.data();
                   if(dats == null){
                      setState(() {
                       registered = false;
                     });
                   } else{
                     setState(() {
                       registered = true;
                     });
                   }
                  });
                  } on Exception{
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
                  } else if(registered == true){
                    setState(() {
                    pesanerror = 'Nomor HP sudah terdaftar.';
                    loadingcontrol = false;
                    pesantampil = true;
                  });
                  }
                   else {
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
                        MaterialPageRoute(builder: (context) =>  Otpsection(verificationIds: verificationId, phonenumber: '+62' + inputankontroler.text) ),
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
                  } on Exception{
                      setState(() {
                        pesanerror = 'Request Timeout.';
                        pesantampil = true;
                    });
               
                  }
                  }
                },  
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFffea66),
                  minimumSize: const Size(300, 35),
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