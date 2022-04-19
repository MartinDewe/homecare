import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

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
              selectedColor: Colors.purple,
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

  return Column(
    children: [
      Container(
        height: mediaheight*0.3,
        width : mediawidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/TopMainMenu.jpg'),
            fit: BoxFit.cover
        )
        
        ),
        child: Row(
          children: [
            Column(
              children: [
              Container(
                margin: const EdgeInsets.only(top: 47, bottom: 12),
                width: 170,
                child: const Text('Hallo!',
                  style: TextStyle(
                    color: Colors.black, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 20, ),
                ),
              ),
              
            Container(
              margin: const EdgeInsets.only(left: 20),
              height: mediaheight*0.155,
              width: mediaheight*0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:15, right: 15, left: 15, bottom: 10),
                  child: RichText(
                    textAlign: TextAlign.center,
                  text: const TextSpan(
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400, 
                  fontSize: 20, ),
                  text: 'Segera lengkapi profil anda.' 
                  ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                   print(_auth.currentUser);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(top: 5, right: 8, left: 8, bottom: 5),
                      child:  Text(
                        'Klik Disini >',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400, 
                          fontSize: 15, 
                        ) ,
                      ),
                    ),
                  ),
                )
              ],
              ),
          ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Image(
                image: const AssetImage('assets/mascot.png'),
                height: mediaheight*0.20,  
            ),

          ),
          ],
        ),
      ),
      Row(
        children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 10, top: 50),
          width: mediawidth*0.4,
          height: mediaheight*0.2,
          decoration: BoxDecoration(
            color: const Color(0xfff76992),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
            ],
          ),
          child: Column(
            children:  [
            SizedBox(
              height: mediaheight*0.15,
              child: const Image(
              image:  AssetImage('assets/band-aid.png')
              ),
            ),
            const Text(
              'Rawat Luka',
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500, 
                fontSize: 16, 
                ) ,
            )
            ],
          ), 
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 10, top: 50),
          width: mediawidth*0.4,
          height: mediaheight*0.2,
          decoration: BoxDecoration(
            color: const Color(0xfff76992),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
            ],
          ),
          child: Column(
            children:  [
            SizedBox(
              height: mediaheight*0.15,
              child: const Image(
              image:  AssetImage('assets/infusion.png')
              ),
            ),
            const Text(
              'Pasang Infus',
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500, 
                fontSize: 16, 
                ) ,
            )
            ],
          ), 
        ),
        
        
        ],
      ),

      Row(
        children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 10, top: 30),
          width: mediawidth*0.4,
          height: mediaheight*0.2,
          decoration: BoxDecoration(
            color: const Color(0xfff76992),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
            ],
          ),
          child: Column(
            children:  [
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: SizedBox(
                height: mediaheight*0.14,
                child: const Image(
                image:  AssetImage('assets/nurse.png')
                ),
              ),
            ),
            const Text(
              'Jasa Perawat',
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500, 
                fontSize: 16, 
                ) ,
            )
            ],
          ), 
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 10, top: 30),
          width: mediawidth*0.4,
          height: mediaheight*0.2,
          decoration: BoxDecoration(
            color: const Color(0xfff76992),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
            ],
          ),
          child: Column(
            children:  [
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: SizedBox(
                height: mediaheight*0.14,
                child: const Image(
                image:  AssetImage('assets/sick.png')
                ),
              ),
            ),
            const Text(
              'Jaga Pasien',
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500, 
                fontSize: 16, 
                ) ,
            )
            ],
          ), 
        ),
        
        
        ],
      ),

    ],
  );
}

_SkeltonView()  {

  final mediawidth = MediaQuery.of(context).size.width;
  final mediaheight = MediaQuery.of(context).size.height;

  setState(() {
    navcontrol = false;
  });

  return Column(
    children: [
    Container(
      width: mediawidth,
      height: mediaheight*0.2,
      margin: EdgeInsets.only(left:15, right: 15, top: mediaheight*0.08),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12)
      ),
      child: Row(
        children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20, right: 13),
              child: SkeletonLine(
                style: SkeletonLineStyle(
                  width: mediawidth*0.3,
                  height: 15,
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10, left: 20),
              child: Row(
               children: [ 
                 SkeletonAvatar(  
                 style: SkeletonAvatarStyle(
                  shape: BoxShape.rectangle,
                  width: mediawidth*0.42,
                  height: mediaheight*0.1,
                  borderRadius: BorderRadius.circular(8),
                  )
                ),
               ]
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SkeletonAvatar(  
            style: SkeletonAvatarStyle(
            shape: BoxShape.circle,
            width: mediawidth*0.35,
            height: mediaheight*0.15,
            )
          ),
        ),
        ]
      ),
        
    ),

    Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 18, top: mediaheight*0.1 ),
              width: mediawidth*0.4,
              height: mediaheight*0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: mediawidth*0.27,
                        height: mediaheight*0.13,
                        borderRadius: BorderRadius.circular(12),
                      ),
                     ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 17 ),
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                        width: mediawidth*0.3,
                        height: 15,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                  ),
                ],
              )
            ),

            Container(
              margin: EdgeInsets.only(left: 35, top: mediaheight*0.1 ),
              width: mediawidth*0.4,
              height: mediaheight*0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: mediawidth*0.27,
                        height: mediaheight*0.13,
                        borderRadius: BorderRadius.circular(12),
                      ),
                     ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 17 ),
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                        width: mediawidth*0.3,
                        height: 15,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                  ),
                ],
              )
            ),
          ],
        ),

         Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 18, top: mediaheight*0.05 ),
              width: mediawidth*0.4,
              height: mediaheight*0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: mediawidth*0.27,
                        height: mediaheight*0.13,
                        borderRadius: BorderRadius.circular(12),
                      ),
                     ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 17 ),
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                        width: mediawidth*0.3,
                        height: 15,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                  ),
                ],
              )
            ),

            Container(
              margin: EdgeInsets.only(left: 35, top: mediaheight*0.05 ),
              width: mediawidth*0.4,
              height: mediaheight*0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: mediawidth*0.27,
                        height: mediaheight*0.13,
                        borderRadius: BorderRadius.circular(12),
                      ),
                     ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 17 ),
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                        width: mediawidth*0.3,
                        height: 15,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                  ),
                ],
              )
            ),
          ],
        ),

        Center(
          child: Container(
            margin: EdgeInsets.only(top: mediaheight*0.08),
            height: mediaheight*0.06,
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
    )

    ]
  );
   
}

}

enum _SelectedTab { home, favorite, search, person }



