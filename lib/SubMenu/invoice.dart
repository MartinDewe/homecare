import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


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
                    padding: EdgeInsets.only(top : mediaheight*0.07, left: mediawidth*0.01),
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

                  CustomPaint(
                    size: Size(mediawidth*0.85,mediaheight*0.07), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RPSCustomPainter(),
                  ),
                  Container(
                    height: mediaheight*0.8,
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
                                'Jumlah Total',
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
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 22,
                                  ), 
                                ),

                                Text(
                                'Rp. 250.000',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 22,
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
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 25,
                                  offset: const Offset(0, 1), // changes position of shadow
                                ),
                              ],
                              )
                              
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
             
            ],
          ),
        )
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
