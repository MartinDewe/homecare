import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:perawat_app/SubMenu/loading.dart';


class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {

    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[300],
        body: SingleChildScrollView(
          child: Stack(
            children: [
                Container(
                height: mediaheight*0.23,
                alignment: Alignment.centerRight,
                child: Lottie.asset(
                  'assets/make-payment.json',
                ),
              ),
             
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top : mediaheight*0.06, left: mediawidth*0.01),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => 
                          Navigator.of(context).pop(),
                        ), 
                       Text(
                        'Invoice Order',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 24,
                          ), 
                        ), 
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: mediaheight*0.07),
                    height: mediaheight*0.85,
                    width: mediawidth,
                    decoration:  BoxDecoration(
                      color: Colors.grey[50], 
                      borderRadius: const BorderRadius.only(
                        topRight:  Radius.circular(30.0)
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top : 20, left: mediawidth*0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(right: mediawidth*0.08),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                'Invoice #0001',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black54,
                                    fontSize: 19,
                                  ), 
                                ),
                                Text(
                                'Metode Bayar',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black54,
                                    fontSize: 19,
                                  ), 
                                ),
                              ],
                            ),
                          ), 
                          Padding(
                            padding:  EdgeInsets.only(top:8, right: mediawidth*0.08),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                'Ilham M. H.',
                                  style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 22,
                                  ), 
                                ),

                                Text(
                                'Cash',
                                  style: GoogleFonts.openSans(
                                    color: Colors.lightBlue,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                  ), 
                                ),
                              ],
                            ),
                          ), 

                          SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.only(top:mediaheight*0.03),
                              width: mediawidth,
                              height: mediaheight*0.6,
                              decoration:   BoxDecoration(
                                color: Colors.white, 
                                borderRadius: const BorderRadius.only(
                                  topLeft:  Radius.circular(15.0),
                                  bottomLeft:  Radius.circular(15.0)
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: mediawidth,
                                    height: mediaheight*0.2,
                                    decoration:   BoxDecoration(
                                      color: Colors.yellow[100], 
                                      borderRadius: const BorderRadius.only(
                                        topLeft:  Radius.circular(15.0),
                                      ),
                                    ),
                                   child:  const Padding(
                                     padding: EdgeInsets.all(15.0),
                                     child:  Image(
                                      image: AssetImage('assets/mascot.png'),
                                     
                                  ),
                                   ),
                                  ),

                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.description_outlined, color: Colors.black),
                                      onPressed: (){},
                                    ), 
                                    Text(
                                    'Invoice Details',
                                      style: GoogleFonts.openSans(
                                        color: Colors.black,
                                        fontSize: 19,
                                      ), 
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: mediawidth*0.04),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                          'Nama Perawat',
                                            style: GoogleFonts.openSans(
                                              color: Colors.black54,
                                              fontSize: 16,
                                            ), 
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top:mediaheight*0.008),
                                            child: Text(
                                            'Grace Dion',
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

                                    Container(
                                      width: 2,
                                      height: 40,
                                      color: Colors.black54,
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(right: mediawidth*0.08),
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
                                            padding: EdgeInsets.only(top:mediaheight*0.008),
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

                                  Container(
                                    margin: EdgeInsets.only( top:mediaheight*0.014, left: mediawidth*0.045, right: mediawidth*0.06 ),
                                    width: mediawidth,
                                    height: 1,
                                    color: Colors.grey,
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
                                              'Harga',
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
                                ],
                              ),
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),

                  Padding(
                    padding:  EdgeInsets.only(top: mediaheight*0.126),
                    child: CustomPaint(
                      size: Size(mediawidth*0.85,mediaheight*0.07), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: RPSCustomPainter(),
                    ),
                  ),
                
             
            ],
          ),
        ),

        bottomNavigationBar: Container(
          width: mediawidth,
          height: mediaheight*0.08,
          color: Colors.grey[50],
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: mediawidth*0.06, right: mediawidth*0.07),
            child: SizedBox(
              width: mediawidth,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                    this.context,
                    MaterialPageRoute(builder: (context) => const Loadingback() ),
                    (Route<dynamic> route) => false
                  );
                },
                child: const Text("Order Sekarang",
                  style: TextStyle(
                    color: Colors.black, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 16, ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan[200],
                  
                ),
              ),
            ),
          ),
        ),

      )
    );

  }
}

class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {

  Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 250, 250, 250)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.6262500,size.height);
    path0.lineTo(size.width*0.5012500,size.height*0.6000000);
    path0.quadraticBezierTo(size.width*0.2659375,size.height*0.5990000,size.width*0.0637500,size.height*0.6000000);
    path0.quadraticBezierTo(size.width*-0.0022875,size.height*0.7007200,0,size.height);
    path0.lineTo(size.width*0.6262500,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
