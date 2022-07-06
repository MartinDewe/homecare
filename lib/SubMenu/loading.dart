import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:perawat_app/NavPages/menu.dart';
import 'package:perawat_app/SubMenu/orderdone.dart';


final Stream<QuerySnapshot> invoice =  FirebaseFirestore.instance.collection('invoice').snapshots();


class Loadingback extends StatefulWidget {
  const Loadingback({Key? key}) : super(key: key);

  @override
  State<Loadingback> createState() => _LoadingbackState();
}

class _LoadingbackState extends State<Loadingback> {

  @override
  void initState() {
    super.initState();
    firebaseupdate();
  }

  firebaseupdate(){
    FirebaseFirestore.instance.collection('invoice').doc('#0001').set(
      {
        'Nama Perawat' : 'Grace Dion',
        'Nama Client' : 'Ilham M. H.',
        'Order Diterima' : false,
        'Total Biaya' : '250.000',
      }
    );
    FirebaseFirestore.instance.collection('nurse').doc('+6281217115704').update(
      {
        'order in' : true,
      }
    );
  }


  @override
  Widget build(BuildContext context) {

    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child : AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
              systemNavigationBarColor: Colors.black87,
          ),
            child : StreamBuilder<QuerySnapshot>(
              stream: invoice ,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot ){
              if (snapshot.hasError){
                return const Text('HasError');
              }
              else if(snapshot.connectionState == ConnectionState.waiting){
                return const Text('');
              }
              
              final data = snapshot.requireData;
              final validate = data.docs[0]['Order Diterima'] as bool;

                return validate? Content2(mediawidth, mediaheight):Content1(mediawidth, mediaheight);
                    
                },
              )
            
        ),
      ),
    )
    );
    
  }

   Content1(mediawidth, mediaheight){

    return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top : mediaheight*0.3),
        child: Image(
          image: AssetImage('assets/mascot.png'),
          width: mediawidth*0.3
          
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: mediaheight*0.02),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Sedang Menghubungi',
            style:GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold, 
                fontSize: 26
              ),     
              
            children: <TextSpan>[
              TextSpan(text: ' Perawat', style: GoogleFonts.poppins(
                color: Colors.yellow[200],
                fontWeight: FontWeight.bold, 
                fontSize: 26,
              ),     
              ), 
              
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top : mediaheight*0.05),
        child: Lottie.asset(
          'assets/dot-loader-animation.json',
          width: mediawidth*0.15
        ),
      ),

      ]
    );
  }

startTimer() async {
    Future.delayed(const Duration(seconds: 5) ,() {
       Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => const OrderDone()
      ));
  });
  }
  Content2(mediawidth, mediaheight){
      
    startTimer();
    return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top : mediaheight*0.3),
        child: Lottie.asset(
          'assets/happy-pencil.json',
          width: mediawidth*0.6
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: mediaheight*0.02),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Berhasil Menghubungi',
            style:GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold, 
                fontSize: 26
              ),     
              
            children: <TextSpan>[
              TextSpan(text: ' Perawat', style: GoogleFonts.poppins(
                color: Colors.teal[200],
                fontWeight: FontWeight.bold, 
                fontSize: 26,
              ),     
              ), 
              
            ],
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(top : mediaheight*0.1),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '" Perawat akan datang ke',
              style:GoogleFonts.poppins(
                  color: Colors.yellow[200],
                  fontWeight: FontWeight.bold, 
                  fontSize: 17
                ),     
                
              children: <TextSpan>[
                TextSpan(text: ' Rumahmu "', style: GoogleFonts.poppins(
                  color: Colors.red[200],
                  fontWeight: FontWeight.bold, 
                  fontSize: 17,
                ),     
                ), 
                
              ],
            ),
          ),
      ),

      ]
    );

  
  }
 
}

