import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:perawat_app/LoginRegister/logout.dart';


final Stream<QuerySnapshot> users = 
  FirebaseFirestore.instance.collection('users').snapshots();

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {

    
  final mediawidth = MediaQuery.of(context).size.width;
  final mediaheight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow[200],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: mediaheight*0.1),
                child: CircleAvatar(
                radius: 56,
                backgroundColor: Colors.yellow[200],
                child: Padding(
                  padding: const EdgeInsets.all(4), // Border radius
                  child: ClipOval(child: Image.asset('assets/girl.png')),
                ),
                ),
              ),
            ),
            
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: mediaheight*0.02),
                child: StreamBuilder<QuerySnapshot>(
                  stream: users,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot ){
                    if (snapshot.hasError){
                      return const Text('HasError');
                    }
                    else if(snapshot.connectionState == ConnectionState.waiting){
                      return const Text('');
                    }
                    final data = snapshot.requireData;
                    final indexing = snapshot.data!.docs;
                    final uuid = FirebaseAuth.instance.currentUser?.uid;
                    int rank = 0;
                    int index = getid(rank, indexing, uuid).toInt();
                  
                    return Text(
                      '${data.docs[index]['name']}',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w400, 
                          fontSize: 18,
                      ),     
                    );
                  },
                ),
              ),
            ),
          
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top:mediaheight*0.06),
              height: mediaheight*0.4965,
              decoration: const BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight:  Radius.circular(40.0)
                ),
              ),
              child: Column(
     
                children: [
                Padding(
                padding: EdgeInsets.only(top:mediaheight*0.03),
                child: Text(
                  'C O N T E N T',
                  style: GoogleFonts.poppins(
                      color: Colors.black38,
                      fontSize: 16,
                  ), 
                ),
              ),
              
              Center(
                child: InkWell(
                onTap: (){
                
                },
                child: Padding(
                  padding: EdgeInsets.only(top: mediaheight*0.03),
                  child: Ink(
                    width: mediawidth*0.9,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                            padding: EdgeInsets.only(left : mediawidth*0.05, right: mediawidth*0.02),
                            child: const  Icon(
                              Icons.person,
                              color: Colors.black54,
                            ),
                          ),
                      
                        Text(
                          'Profil',
                            style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400, 
                            fontSize: 20,
                          ), 
                      ),
                      ]
                      ),
          
                        Padding(
                          padding: EdgeInsets.only(right : mediawidth*0.02),
                          child: const  Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.black54,
                          ),
                        ),
                      
                        
                      ]
                    ),
                  ),
                ),
                ),
              ),
                  
          
              Center(
              child: GestureDetector(
              onTap: (){
               
              },
              child: Container(
                margin: EdgeInsets.only(top: mediaheight*0.01),
                width: mediawidth*0.9,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                        padding: EdgeInsets.only(left : mediawidth*0.05, right: mediawidth*0.02),
                        child: const  Icon(
                          Icons.settings,
                          color: Colors.black54,
                        ),
                      ),
                  
                    Text(
                      'Pengaturan',
                        style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w400, 
                        fontSize: 20,
                      ), 
                   ),
                  ]
                  ),
          
                     Padding(
                      padding: EdgeInsets.only(right : mediawidth*0.02),
                      child: const  Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.black54,
                      ),
                    ),
                  
                    
                  ]
                ),
              ),
              ),
                  ),
                  
                   Center(
              child: GestureDetector(
              onTap: (){
               
              },
              child: Container(
                margin: EdgeInsets.only(top: mediaheight*0.01),
                width: mediawidth*0.9,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                        padding: EdgeInsets.only(left : mediawidth*0.05, right: mediawidth*0.02),
                        child: const  Icon(
                          Icons.info,
                          color: Colors.black54,
                        ),
                      ),
                  
                    Text(
                      'Informasi',
                        style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w400, 
                        fontSize: 20,
                      ), 
                   ),
                  ]
                  ),
          
                     Padding(
                      padding: EdgeInsets.only(right : mediawidth*0.02),
                      child: const  Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.black54,
                      ),
                    ),
                  
                    
                  ]
                ),
              ),
              ),
                  ),
                  
          
              Center(
              child: GestureDetector(
              onTap: (){
                _bottomsheet();
               
                
              },
              child: Container(
                margin: EdgeInsets.only(top: mediaheight*0.01),
                width: mediawidth*0.9,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                        padding: EdgeInsets.only(left : mediawidth*0.05, right: mediawidth*0.02),
                        child: const  Icon(
                          Icons.logout,
                          color: Colors.black54,
                        ),
                      ),
                  
                    Text(
                      'Log Out',
                        style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w400, 
                        fontSize: 20,
                      ), 
                   ),
                  ]
                  ),
          
                     Padding(
                      padding: EdgeInsets.only(right : mediawidth*0.02),
                      child: const  Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.black54,
                      ),
                    ),
                  
                    
                  ]
                ),
              ),
              ),
                  ),
                ],
              ),
            ),
          )
          
        ]
        ),
      ),
      
    );

  }

  getid(int rank, var data,String? uid,){
    for (int i = 0; i < data.length; i++) {
    if (uid == data[i].reference.id) {
      rank = i + 1;
    }
    }
    return rank;
  }

void _bottomsheet(){
  
  final mediawidth = MediaQuery.of(context).size.width;
  final mediaheight = MediaQuery.of(context).size.height;

  showModalBottomSheet(
    context: context, 
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (builder){
    return Container(
      height: mediaheight*0.4,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight:  Radius.circular(20.0)
        ),
        color: Colors.white,    
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: mediaheight*0.03),
            child: Text(
              'Apakah Anda Yakin Mau Keluar ?',
               style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w400, 
                  fontSize: 18,
              ), 
            ),
          ),
          Lottie.asset(
            'assets/cat.json',
            height: mediaheight*0.2
            ),
            Padding(
              padding: EdgeInsets.only(bottom:mediaheight*0.02),
              child: Material(
                child: InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => const Logout()
                    ));
                  },
                  child: Ink(
                    width: mediawidth*0.7,
                    height: mediaheight*0.055,
                    decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text(
                          'Keluar',
                            style: GoogleFonts.karla(
                            color: Colors.white,
                            fontSize: 18,
                          ), 
                   ),
                    ),
                  )
                ),
              ),
            )
        ],
      )

    );

    }
    
  );
}

}