import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletons/skeletons.dart';
import 'package:google_fonts/google_fonts.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  
  var _selectedTab = _SelectedTab.home;
  bool navcontrol = true;
  bool isloading = true;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    Future.delayed(const Duration(seconds: 4) ,() {
    setState(() {
      isloading = false;
    });
  });
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: isloading? _SkeltonView() : _ContentView()
        ),

        bottomNavigationBar: navcontrol? DotNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          onTap: _handleIndexChanged,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          // dotIndicatorColor: Colors.black,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: const Icon(Icons.home),
              selectedColor: Colors.indigo,
            ),

            /// Likes
            DotNavigationBarItem(
              icon: const Icon(Icons.swap_vert),
              selectedColor: Colors.pink,
            ),

            /// Search
            DotNavigationBarItem(
              icon: const Icon(Icons.article_sharp),
              selectedColor: Colors.orange,
            ),

            /// Profile
            DotNavigationBarItem(
              icon: const Icon(Icons.person),
              selectedColor: Colors.teal,
            ),
            
          ],
        ):null
      )
      
    );
  }

_ContentView() {

  final mediawidth = MediaQuery.of(context).size.width;
  final mediaheight = MediaQuery.of(context).size.height;

   setState(() {
    navcontrol = true;
  });

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

_SkeltonView()  {

  final mediawidth = MediaQuery.of(context).size.width;
  final mediaheight = MediaQuery.of(context).size.height;

  setState(() {
    navcontrol = false;
  });

  return Stack(
    children: [
        Column(
        children: [
        Padding(
          padding:  EdgeInsets.only(top:mediaheight*0.08, left: 35),
          child: SkeletonLine(
            style: SkeletonLineStyle(
              height: 24,
              width: mediawidth*0.3,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only( top: 10, left: 35),
          child: SkeletonLine(
            style: SkeletonLineStyle(
              height: 20,
              width: mediawidth*0.5,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top:mediaheight*0.04),
          child: SkeletonAvatar(
            style: SkeletonAvatarStyle(
                width: mediawidth*0.83,
                height: mediaheight*0.2,
                borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top:mediaheight*0.06, left: 35),
          child: SkeletonLine(
            style: SkeletonLineStyle(
              height: 20,
              width: mediawidth*0.4,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.only(left:35, right: 35),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.03),
                    child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: mediawidth*0.15,
                        height: mediaheight*0.075,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.01),
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 12,
                        width: mediawidth*0.15,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ]
              ),

              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.03),
                    child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: mediawidth*0.15,
                        height: mediaheight*0.075,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.01),
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 12,
                        width: mediawidth*0.15,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ]
              ),

              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.03),
                    child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: mediawidth*0.15,
                        height: mediaheight*0.075,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.01),
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 12,
                        width: mediawidth*0.15,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ]
              ),

              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.03),
                    child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: mediawidth*0.15,
                        height: mediaheight*0.075,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:mediaheight*0.01),
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 12,
                        width: mediawidth*0.15,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ]
              ),
            ],
          ),
        ),
        
      ]
      ),
      
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [  
        Padding(
          padding: EdgeInsets.only(bottom:mediaheight*0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: mediaheight*0.08),
                height: mediaheight*0.07,
                width : mediawidth*0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10 , left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          shape: BoxShape.circle,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          shape: BoxShape.circle,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          shape: BoxShape.circle,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          shape: BoxShape.circle,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                )
              ),
            )
          ],
            ),
        ),
        ]
      )
    ]
  );
   
}

}

enum _SelectedTab { home, favorite, search, person }



