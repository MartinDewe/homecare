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
          padding: EdgeInsets.only(top:mediaheight*0.08, left: 35),
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
          padding: const EdgeInsets.only(left: 35),
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
                margin: EdgeInsets.only(top: mediaheight*0.04, left: 20),
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
            padding: EdgeInsets.only(top:mediaheight*0.06, left: 35),
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
            padding: const EdgeInsets.only(left:35, right: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top:mediaheight*0.03),
                  child: GestureDetector(
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
                ),

                //break Line 1
                Padding(
                  padding: EdgeInsets.only(top:mediaheight*0.03),
                  child: GestureDetector(
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
                ),
                Padding(
                  padding: EdgeInsets.only(top:mediaheight*0.03),
                  child: GestureDetector(
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
                ),
                Padding(
                  padding: EdgeInsets.only(top:mediaheight*0.03),
                  child: GestureDetector(
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

}

