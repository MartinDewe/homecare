import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:perawat_app/home.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';

final otpinputankcontroler = TextEditingController();
FirebaseAuth _auth = FirebaseAuth.instance;

class Otplogin extends StatefulWidget {

  final String verificationIds;
  final String phonenumber;
  const Otplogin({Key? key, required this.verificationIds, required this.phonenumber }) : super(key: key);
  @override
  _Otplogin createState() => _Otplogin();

}

class _Otplogin extends State<Otplogin> {

  bool loadingcontrol = false;
  bool errortampil = false;
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
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
              RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold, 
                        fontSize: 24, ),
                        text: 'Kode Berhasil Dikirim !'
                    ),
                ),
              const  Image(
                  image: AssetImage('assets/otpchibi2.png'),
                  width: 300,
                  height: 160,
                ),
              RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold, 
                      fontSize: 24, ),
                      text: 'Masukan 6 Digit Kode OTP :'
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
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      fieldHeight: 45,
                      fieldWidth: 40,
                      inactiveColor: Colors.pinkAccent,
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
                      }on FirebaseAuthException {
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
              SizedBox(
                width: 100,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(top:15 ),
                  child: loadingcontrol? const LoadingIndicator(
                    indicatorType: Indicator.lineScale, /// Required, The loading type of the widget
                    colors:  [Colors.amberAccent],       /// Optional, The color collections
                    strokeWidth: 4.0,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                    pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
                  ):const Center(),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
