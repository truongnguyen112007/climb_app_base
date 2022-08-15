import 'package:climb_app_base/modules/climb/climb_page.dart';
import 'package:climb_app_base/modules/profile/profile_page.dart';
import 'package:climb_app_base/modules/reservations/reservations_page.dart';
import 'package:flutter/material.dart';

import '../routes/routes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs = [
    Container(
      child: Center(
        child: Text('Home Page'),
      ),
    ),
    RoutesPage(),
    ClimbPage(),
    ReservationsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(child: SizedBox()),
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
                        itemBottomNavigationBar(Icons.home_filled, 'home'),
                        itemBottomNavigationBar(Icons.map_outlined, 'Routes'),
                        const Expanded(child: SizedBox()),
                        itemBottomNavigationBar(
                            Icons.date_range_sharp, 'Resevations'),
                        itemBottomNavigationBar(
                            Icons.person_outline_outlined, 'Profile'),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(60),
                                  topRight: Radius.circular(60))),
                          child: Icon(
                            Icons.thumb_up_alt_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Climb", style: TextStyle(color: Colors.white)),
                      ],
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
}

Widget itemBottomNavigationBar(IconData icon, String index) => Expanded(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(
          index,
          style: TextStyle(color: Colors.white),
        )
      ],
    ));
