import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


final inputankontroler = TextEditingController();
final emailkontroler = TextEditingController();
final uuid = FirebaseAuth.instance.currentUser?.uid;
final Stream<QuerySnapshot> users =  FirebaseFirestore.instance.collection('users').snapshots();

class Userprofile extends StatefulWidget {
  const Userprofile({Key? key}) : super(key: key);

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
  final mediawidth = MediaQuery.of(context).size.width;
  final mediaheight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => 
            Navigator.of(context).pop(),
            ), 
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title:  Text(
            'Edit Profile',
              style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w400, 
              fontSize: 20,
            ), 
          ),
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: mediaheight*0.03),
                  child: CircleAvatar(
                    radius: mediaheight*0.075,
                    backgroundColor: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(2), // Border radius
                      child: Image.asset('assets/mascot.png'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: mediaheight*0.05,left: mediawidth*0.07, right: mediawidth*0.07),
                child: TextFormField(
                  controller: inputankontroler,
                  onChanged: (content){},
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                  ),
                  validator: (value){
                  bool _isCondition = value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value);
                   if(_isCondition){
                     return 'Masukan Nama Dengan Benar';
                   } else {
                     return null;
                   }
                  },
                ),
              ),
        
              Padding(
                padding: EdgeInsets.only(top: mediaheight*0.02, left: mediawidth*0.07, right: mediawidth*0.07),
                child: TextFormField(
                  controller: emailkontroler,
                  onChanged: (content){
                
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value){
                  bool _isCondition = value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value);
                   if(_isCondition){
                     return 'Masukan Email Dengan Benar';
                   } else {
                     return null;
                   }
                  },
                ),
              ),
        
        
            ],
          ),
        ),

        floatingActionButton: 
          Padding(
            padding:  EdgeInsets.only(left: mediawidth*0.1),
            child: SizedBox(
              width: mediawidth,
              child: ElevatedButton(
                onPressed: () async {
                  if(_formKey.currentState!.validate()) {
                  await FirebaseFirestore.instance.collection('users').doc(uuid).update(
                      {
                        'name': inputankontroler.text,
                        'email' : emailkontroler.text,
                      }
                  );
                  Flushbar(
                      title:  "Berhasil",
                      message:  "Profile Berhasil Diperbarui",
                      duration:  const Duration(seconds: 3),
                      flushbarPosition: FlushbarPosition.TOP,
                      backgroundColor: Colors.black87,
                      margin: EdgeInsets.only(top: mediaheight*0.01, left: mediawidth*0.03, right: mediawidth*0.03),
                      borderRadius: BorderRadius.circular(15),
                      icon: const Icon(
                        Icons.check_circle_rounded,
                        color: Color.fromARGB(255, 88, 228, 93),
                  ),

                ).show(context);

                  }
                }, 
                child: const Text("Ubah Profile",
                  style: TextStyle(
                    color: Colors.black, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 16, ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
      ),
    );

    _formFilled(){

      

    }

  }
}