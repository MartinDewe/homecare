import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:perawat_app/NavPages/history.dart';
import 'package:perawat_app/NavPages/menu.dart';
import 'package:perawat_app/NavPages/nursepage.dart';
import 'package:perawat_app/NavPages/profile.dart';
import 'package:skeletons/skeletons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  List pages = const [
    MainMenu(),
    History(),
    Nursepage(),
    Profile(),
  ];
  
  var _selectedTab = _SelectedTab.home;
  bool navcontrol = false;
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
      navcontrol = true;
    });
  });
  }

  @override
  Widget build(BuildContext context) {

    var tabindex = _SelectedTab.values.indexOf(_selectedTab);

    return MaterialApp(
       home: Scaffold(
        backgroundColor: Colors.white,
        body: isloading? skeltonView(): pages[tabindex],
        bottomNavigationBar: navcontrol? DotNavigationBar(
          currentIndex: tabindex,
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


skeltonView()  {

  final mediawidth = MediaQuery.of(context).size.width;
  final mediaheight = MediaQuery.of(context).size.height;

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



