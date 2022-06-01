import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenu createState() => _MainMenu();
}

class _MainMenu extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return contentView();
  }

  contentView() {

  final mediawidth = MediaQuery.of(context).size.width;
  final mediaheight = MediaQuery.of(context).size.height;

  return Stack(
    children:[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
          padding: EdgeInsets.only(top:mediaheight*0.08, left: mediawidth*0.0975),
          child: Text(
            'Hallo !',
             style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold, 
              fontSize: 24,
            ),     
          )
          ),
          Padding(
          padding: EdgeInsets.only(left: mediawidth*0.0975),
          child: Text(
            'Bagaimana Harimu ?',
             style: GoogleFonts.poppins(
                color: Colors.black45,
                fontWeight: FontWeight.w400, 
                fontSize: 18,
            ),     
          )
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top:mediaheight*0.04),
              width: mediawidth*0.83,
              height: mediaheight*0.2, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.yellow[200]
              ),
              child: Container(
                margin: EdgeInsets.only(top: mediaheight*0.04, left: mediawidth*0.055),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                  Text(
                  'Tetap Jaga',
                  style: GoogleFonts.poppins(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500, 
                      fontSize: 20,
                  ),     
                  ),
                  Text(
                  'Kesehatanmu',
                  style: GoogleFonts.poppins(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500, 
                      fontSize: 20,
                  ), 
                  ),
                  
                  ]
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:mediaheight*0.06, left: mediawidth*0.0975),
            child: Text(
              'Layanan Kami',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w500, 
                  fontSize: 18,
              ), 
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left:mediawidth*0.1, right: mediawidth*0.1, top:mediaheight*0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Start Content
                GestureDetector(
                  onTap: (){
                      
                  },
                  child: Column(
                    children: [
                      Container(
                      width: mediawidth*0.15,
                      height: mediaheight*0.075,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.yellow[100],
                        border: Border.all(color: Colors.yellow.shade200)      
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.all(10.0),
                        child:  Image(
                          image: AssetImage('assets/coronavirus.png'),
                        ),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.only(top:mediaheight*0.01),
                      child: Text(
                        'Covid-19',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal, 
                            fontSize: 12,
                        ), 
                      ),
                    ),
                    ]
                  ),
                ),

                //break Line 1
                GestureDetector(
                  onTap: (){

                  },
                  child: Column(
                    children: [
                      Container(
                      width: mediawidth*0.15,
                      height: mediaheight*0.075,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.yellow[100],
                        border: Border.all(color: Colors.yellow.shade200)      
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.all(10.0),
                        child:  Image(
                          image: AssetImage('assets/infus-icon.png'),
                        ),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.only(top:mediaheight*0.01),
                      child: Text(
                        'Infus',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal, 
                            fontSize: 12,
                        ), 
                      ),
                    ),
                    ]
                  ),
                ),

                //break line 2
                GestureDetector(
                  onTap: (){

                  },
                  child: Column(
                    children: [
                      Container(
                      width: mediawidth*0.15,
                      height: mediaheight*0.075,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.yellow[100],
                        border: Border.all(color: Colors.yellow.shade200)      
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.all(10.0),
                        child:  Image(
                          image: AssetImage('assets/syringe.png'),
                        ),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.only(top:mediaheight*0.01),
                      child: Text(
                        'Injeksi',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal, 
                            fontSize: 12,
                        ), 
                      ),
                    ),
                    ]
                  ),
                ),

                //break line 3
                GestureDetector(
                  onTap: (){
                    _bottomsheet();
                  },
                  child: Column(
                    children: [
                      Container(
                      width: mediawidth*0.15,
                      height: mediaheight*0.075,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.yellow[100],
                        border: Border.all(color: Colors.yellow.shade200)      
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.all(10.0),
                        child:  Image(
                          image: AssetImage('assets/other.png'),
                        ),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.only(top:mediaheight*0.01),
                      child: Text(
                        'Lainnya',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal, 
                            fontSize: 12,
                        ), 
                      ),
                    ),
                    
                    ]
                  ),
                ),
                 
              ], //deadline
            ),
          )
        ],
      ),
      Container(
        margin: EdgeInsets.only(top:mediaheight*0.18),
        height: mediaheight*0.25,
        alignment: Alignment.centerRight,
        child: Lottie.asset(
          'assets/meditation-icon.json',
        ),
      ),
      

    ]
  );
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
      height: mediaheight*0.6,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight:  Radius.circular(20.0)
        ),
        color: Colors.white,    
      ),
      child:  Stack(
        children: [
          Padding(
          // Start Content
          padding: EdgeInsets.only(left:mediawidth*0.1, right: mediawidth*0.1, top:mediaheight*0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
      
                },
                child: Column(
                  children: [
                    Container(
                    width: mediawidth*0.15,
                    height: mediaheight*0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow[100],
                      border: Border.all(color: Colors.yellow.shade200)      
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.all(10.0),
                      child:  Image(
                        image: AssetImage('assets/coronavirus.png'),
                      ),
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.01),
                    child: Text(
                      'Covid-19',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal, 
                          fontSize: 12,
                      ), 
                    ),
                  ),
                  ]
                ),
              ),
      
              //break Line 1
              GestureDetector(
                onTap: (){
      
                },
                child: Column(
                  children: [
                    Container(
                    width: mediawidth*0.15,
                    height: mediaheight*0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow[100],
                      border: Border.all(color: Colors.yellow.shade200)      
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.all(10.0),
                      child:  Image(
                        image: AssetImage('assets/infus-icon.png'),
                      ),
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.01),
                    child: Text(
                      'Infus',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal, 
                          fontSize: 12,
                      ), 
                    ),
                  ),
                  ]
                ),
              ),
      
              //break Line 2
      
              GestureDetector(
                onTap: (){
      
                },
                child: Column(
                  children: [
                    Container(
                    width: mediawidth*0.15,
                    height: mediaheight*0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow[100],
                      border: Border.all(color: Colors.yellow.shade200)      
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.all(10.0),
                      child:  Image(
                        image: AssetImage('assets/syringe.png'),
                      ),
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.01),
                    child: Text(
                      'Injeksi',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal, 
                          fontSize: 12,
                      ), 
                    ),
                  ),
                  ]
                ),
              ),
      
              //break Line 3
              GestureDetector(
                onTap: (){
      
                },
                child: Column(
                  children: [
                    Container(
                    width: mediawidth*0.15,
                    height: mediaheight*0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow[100],
                      border: Border.all(color: Colors.yellow.shade200)      
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.all(10.0),
                      child:  Image(
                        image: AssetImage('assets/apple.png'),
                      ),
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.01),
                    child: Column(
                      children: [
                        Text(
                        'Konsultasi',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal, 
                          fontSize: 11,
                          ), 
                        ),
                        Text(
                        'Gizi',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal, 
                          fontSize: 11,
                          ), 
                        ),
                    ]
                    ),
                  ),
                  ]
                ),
              ),
              
              //deadline  
            ], 
          ),
        ),

        Padding(
          // Start Content
          padding: EdgeInsets.only(left:mediawidth*0.1, right: mediawidth*0.1, top:mediaheight*0.19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
             
                },
                child: Column(
                  children: [
                    Container(
                    width: mediawidth*0.15,
                    height: mediaheight*0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow[100],
                      border: Border.all(color: Colors.yellow.shade200)      
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.all(10.0),
                      child:  Image(
                        image: AssetImage('assets/injury.png'),
                      ),
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.01),
                    child: Column(
                      children: [
                        Text(
                        'Control',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal, 
                          fontSize: 11,
                          ), 
                        ),
                        Text(
                        'Luka',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal, 
                          fontSize: 11,
                          ), 
                        ),
                    ]
                    ),
                  ),
                  ]
                ),
              ),
      
              //break Line 1
              GestureDetector(
                onTap: (){
      
                },
                child: Column(
                  children: [
                    Container(
                    width: mediawidth*0.15,
                    height: mediaheight*0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow[100],
                      border: Border.all(color: Colors.yellow.shade200)      
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.all(10.0),
                      child:  Image(
                        image: AssetImage('assets/scissors.png'),
                      ),
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.01),
                    child: Text(
                      'Khitan',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal, 
                          fontSize: 12,
                      ), 
                    ),
                  ),
                  ]
                ),
              ),
      
              //break Line 2
      
              GestureDetector(
                onTap: (){
      
                },
                child: Column(
                  children: [
                    Container(
                    width: mediawidth*0.15,
                    height: mediaheight*0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow[100],
                      border: Border.all(color: Colors.yellow.shade200)      
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.all(10.0),
                      child:  Image(
                        image: AssetImage('assets/nurse.png'),
                      ),
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.01),
                    child: Column(
                      children: [
                        Text(
                        'Jaga',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal, 
                          fontSize: 11,
                          ), 
                        ),
                        Text(
                        'Pasien',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal, 
                          fontSize: 11,
                          ), 
                        ),
                    ]
                    ),
                  ),
                  ]
                ),
              ),
      
              //break Line 3
              GestureDetector(
                onTap: (){
      
                },
                child: Column(
                  children: [
                    Container(
                    width: mediawidth*0.15,
                    height: mediaheight*0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow[100],
                      border: Border.all(color: Colors.yellow.shade200)      
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.all(10.0),
                      child:  Image(
                        image: AssetImage('assets/blood-test.png'),
                      ),
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.01),
                    child:
                        Text(
                        'Cek Darah',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal, 
                          fontSize: 11,
                          ), 
                        ),
                      
                  ),
                  ]
                ),
              ),
              
              //deadline  
            ], 
          ),
        ),
        ]
      ),

      // END Content

    );
    }
    
  );
                     

}

}

