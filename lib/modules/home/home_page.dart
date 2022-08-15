import 'package:climb_app_base/modules/tab_home/tab_home.dart';
import 'package:flutter/material.dart';
import '../tab_climb/tab_climb.dart';
import '../tab_profile/tab_profile.dart';
import '../tab_reservations/tab_reservations.dart';
import '../tab_routes/tab_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageController = PageController();
  int currentTab = 0;
  final tabs = [
    TabHome(),
    TabRoutes(),
    TabClimb(),
    TabReservations(),
    TabProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView(controller: pageController, children: tabs,

            ),
          ),
          Stack(
            children: [
              SizedBox(),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 60,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemBottomNavigationBar(Icons.home_filled, 0, 'home'),
                        itemBottomNavigationBar(
                            Icons.map_outlined, 1, 'Routes'),
                        const Expanded(child: SizedBox()),
                        itemBottomNavigationBar(
                            Icons.date_range_sharp, 3, 'Resevations'),
                        itemBottomNavigationBar(
                            Icons.person_outline_outlined, 4, 'Profile'),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: 13),
                    child: InkWell(
                      onTap: () {
                        currentTab =2;
                        jumtToPage(2);
                        setState((){});
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                              ),
                            ),
                            child: Icon(
                              Icons.thumb_up_alt_rounded,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Climb", style: TextStyle(color: currentTab==2 ? Colors.red : Colors.grey)),
                        ],
                      ),
                    ),
                    width: 80,
                    height: 90,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void jumtToPage(int index) =>
      pageController.animateToPage(index, duration: Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn);

  Widget itemBottomNavigationBar(IconData icon, int index, String title) =>
      Expanded(
        child: InkWell(
          onTap: () {
            setState(() {
              jumtToPage(index);
              currentTab = index;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.grey,
              ),
              Text(
                title,
                style: TextStyle(color: currentTab==index ? Colors.red:Colors.grey),
              ),
            ],
          ),
        ),
      );
}
