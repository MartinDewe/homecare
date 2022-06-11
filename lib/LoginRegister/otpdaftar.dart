import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:perawat_app/home.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';

final otpinputankcontroler = TextEditingController();
FirebaseAuth _auth = FirebaseAuth.instance;

class Otpsection extends StatefulWidget {

  final String verificationIds;
  final String phonenumber;
  const Otpsection({Key? key, required this.verificationIds, required this.phonenumber }) : super(key: key);
  @override
  _Otpsection createState() => _Otpsection();

}

class _Otpsection extends State<Otpsection> {

  bool loadingcontrol = false;
  bool errortampil = false;
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Stack(
        children: [
          Scaffold(
          backgroundColor: Colors.white,
          appBar:  AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
             ), 
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Center(
            child: Column(
              children:  [
                 Stack(
                    children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Lottie.asset(
                          'assets/background-icon.json',
                          height: mediaheight*0.3
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top:16.0),
                        child: Lottie.asset(
                          'assets/send-sms.json',
                          height: mediaheight*0.3
                        ),
                      ),
                    ),
                    
                    ]
                   ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold, 
                        fontSize: 24, ),
                        text: 'Verifikasi OTP'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: PinCodeTextField(
                    appContext: context,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.scale,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      inactiveColor: Colors.black38,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    controller: otpinputankcontroler,
                    onCompleted: (v) async {
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationIds, smsCode: otpinputankcontroler.text);
                      setState(() {
                        loadingcontrol = true;
                      });
                      try {
                        await _auth.signInWithCredential(credential);
                        final User? users = _auth.currentUser;
                        final uid = users!.uid;
                        await FirebaseFirestore.instance.collection('users').doc(widget.phonenumber).set(
                        {
                          'name': widget.phonenumber,
                          'phone' : widget.phonenumber,
                          'uid' : uid,
                          'email' : null
                        }
                        );
                        setState(() {
                          SystemChannels.textInput.invokeMethod('TextInput.hide');
                          loadingcontrol = false;
                          errortampil = false;
                        });
                        
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage() ),
                            (Route<dynamic> route) => false
                        );
                      }on Exception {
                        setState(() {
                            loadingcontrol = false;
                            errortampil = true;
                        });
      
                      }
                      
                      },
                      onChanged: (value) {
                        setState(() {
                          errortampil = false;
                          currentText = value;
                        });
                       
                      },
                      beforeTextPaste: (text) {
                       
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return false;
                      },
                    ),
                ),
                Visibility(
                  visible: errortampil,
                  child: const Text('Kode Verifikasi Tidak Valid.',
                    style: TextStyle( 
                      color: Colors.redAccent
                    ),
                  ),
                ),
               
              ],
            ),
          ),
        ),
        loadingcontrol? loadingcontent(mediawidth, mediaheight):navbarcolor()
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
        systemNavigationBarColor: Colors.white,
    ),
    child: BackdropFilter(
    filter: ImageFilter.blur(
      sigmaX: 3 ,
      sigmaY: 3,
    ),
    child: Container(
      width: mediawidth,
      height: mediaheight,
      color: Colors.white,
      child: Lottie.asset('assets/preloader-icon.json'),
    ),
  )
  );
}
}
