import 'package:climb_app_base/components/gradient_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../tab_climb/tab_climb.dart';
import '../tab_home/tab_home.dart';
import '../tab_profile/tab_profile.dart';
import '../tab_reservations/tab_reservations.dart';
import '../tab_routes/tab_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> tab = [
    TabHome(),
    TabRoutes(),
    TabClimb(),
    TabReservations(),
    TabProfile()
  ];

  static const TAB_HOME = 0;
  static const TAB_ROUTES = 1;
  static const TAB_CLIMB = 2;
  static const TAB_RESERVATIONS = 3;
  static const TAB_PROFILE = 4;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: tab[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.black,
            iconSize: 22,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.orange,
            selectedLabelStyle: TextStyle(fontSize: 13),
            items: [
              BottomNavigationBarItem(
                  icon: GradientIcon(
                    gradient: LinearGradient(
                      colors: _currentIndex == TAB_HOME
                          ? [Colors.red, Colors.orange]
                          : [Colors.grey, Colors.grey],
                    ),
                    size: 22,
                    icon: Icons.home_filled,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: GradientIcon(
                    gradient: LinearGradient(
                      colors: _currentIndex == TAB_ROUTES
                          ? [Colors.red, Colors.orange]
                          : [Colors.grey, Colors.grey],
                    ),
                    size: 22,
                    icon: Icons.map,
                  ),
                  label: 'Routes'),
              BottomNavigationBarItem(
                  icon: GradientIcon(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.transparent],
                    ),
                    size: 22,
                    icon: Icons.map,
                  ),
                  label: 'Climb'),
              BottomNavigationBarItem(
                  icon: GradientIcon(
                    gradient: LinearGradient(
                      colors: _currentIndex == TAB_RESERVATIONS
                          ? [Colors.red, Colors.orange]
                          : [Colors.grey, Colors.grey],
                    ),
                    size: 22,
                    icon: Icons.date_range_outlined,
                  ),
                  label: 'Reservations'),
              BottomNavigationBarItem(
                  icon: GradientIcon(
                    gradient: LinearGradient(
                      colors: _currentIndex == TAB_PROFILE
                          ? [Colors.red, Colors.orange]
                          : [Colors.grey, Colors.grey],
                    ),
                    size: 22,
                    icon: Icons.person_outline_outlined,
                  ),
                  label: 'Profile'),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 45.h,
              width: 80.w,
              margin: EdgeInsets.only(bottom: 25),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
              child: MaterialButton(
                highlightColor: Colors.transparent,
                child: GradientIcon(
                  gradient: LinearGradient(
                    colors: _currentIndex == TAB_CLIMB
                        ? [Colors.red, Colors.orange]
                        : [Colors.grey, Colors.grey],
                  ),
                  size: 22,
                  icon: Icons.rocket_launch_outlined,
                ),
                onPressed: () => onTabTapped(2),
                splashColor: Colors.transparent,
              ),
            ),
          ),
        )
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
