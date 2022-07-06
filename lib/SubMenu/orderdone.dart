import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:perawat_app/NavPages/menu.dart';


class OrderDone extends StatefulWidget {
  const OrderDone({Key? key}) : super(key: key);

  @override
  State<OrderDone> createState() => _OrderDoneState();
}

class _OrderDoneState extends State<OrderDone> {
  
  @override
  Widget build(BuildContext context) {

    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[200],
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
              systemNavigationBarColor: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                  Positioned(
                    left: mediawidth*0.5,
                    child: Lottie.asset(
                      'assets/galaxy-blob-01.json',
                      width: mediawidth*0.55,
                     
                    ),
                 ),
                 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top : mediaheight*0.06, left: mediawidth*0.04),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => 
                           Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => const MainMenu()
                            ))
                           ),
                      ),
          
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: mediaheight*0.05, left: mediawidth*0.08, right: mediawidth*0.08),
                        width: mediawidth,
                        height: mediaheight*0.8,
                         decoration:  BoxDecoration(
                          color: Colors.white, 
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 25,
                              offset: const Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                       child:   Column(
                         children: [
                           Padding(
                             padding: EdgeInsets.only( top : mediaheight*0.3),
                             child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: mediawidth*0.04),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                        'Invoice #0001',
                                          style: GoogleFonts.openSans(
                                            color: Colors.black54,
                                            fontSize: 16,
                                          ), 
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top:mediaheight*0.008),
                                          child: Text(
                                          'Fisioterapi',
                                            style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ), 
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding:  EdgeInsets.only(right: mediawidth*0.06),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                        'Tanggal Invoice',
                                          style: GoogleFonts.openSans(
                                            color: Colors.black54,
                                            fontSize: 16,
                                          ), 
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top:mediaheight*0.008, left: mediawidth*0.1),
                                          child: Text(
                                          '7 Juli 2022',
                                            style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ), 
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ]
                              ),
                           ),

                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: mediawidth*0.04, top : mediaheight*0.015 ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                  'Rincian',
                                    style: GoogleFonts.openSans(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ), 
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:mediaheight*0.01),
                                    child: Text(
                                    'Biaya Perawat',
                                      style: GoogleFonts.openSans(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ), 
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only( top : mediaheight*0.015, right: mediawidth*0.06 ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                  '  ',
                                    style: GoogleFonts.openSans(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ), 
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:mediaheight*0.01),
                                    child: Text(
                                    'Rp. 100.000',
                                      style: GoogleFonts.openSans(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ), 
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                          ],
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top:mediaheight*0.01, left: mediawidth*0.04),
                                child: Text(
                                'Fisioterapi',
                                  style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ), 
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(top:mediaheight*0.01, right: mediawidth*0.06),
                                child: Text(
                                'Rp. 150.000',
                                  style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ), 
                                ),
                              ),
                            ],
                          ),

                          Container(
                            margin: EdgeInsets.only( top:mediaheight*0.03, left: mediawidth*0.045, right: mediawidth*0.06 ),
                            width: mediawidth,
                            height: 1,
                            color: Colors.grey,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top:mediaheight*0.03, left: mediawidth*0.04),
                                child: Text(
                                'Jumlah Total',
                                  style: GoogleFonts.openSans(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ), 
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(top:mediaheight*0.03, right: mediawidth*0.06),
                                child: Text(
                                'Rp. 250.000',
                                  style: GoogleFonts.openSans(
                                    color: Colors.cyan,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ), 
                                ),
                              ),
                            ],
                          ),

                          Padding(
                                padding: EdgeInsets.only(top:mediaheight*0.08),
                                child: Text(
                                'Order Berhasil !',
                                  style: GoogleFonts.openSans(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                  ), 
                                ),
                              ),
                        ]         
                      ),
                    )
                    )],
                    ),

                    Center(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: mediaheight*0.1),
                            width: mediawidth*0.4,
                            height: mediaheight*0.2,
                            decoration:  BoxDecoration(
                              color: Colors.yellow[100], 
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15.0)
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 25,
                                  offset: const Offset(0, 7), // changes position of shadow
                                ),
                              ],
                            ),
                            child: const Image(
                                image: AssetImage('assets/nurse-png.png'),
                                
                            ),
                          ),

                           Padding(
                             padding: EdgeInsets.only(top : mediaheight*0.02),
                             child: Text(
                              'Grace Dion',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ), 
                              ),
                           ),

                           Text(
                            'Rs. Kamar Medika',
                              style: GoogleFonts.openSans(
                                color: Colors.teal,
                                fontSize: 17,
                              ), 
                            ),

                        ],
                      ),
                    ),
                
               
              ],
            ),
          ),
      ),
    )
    );
  }
}