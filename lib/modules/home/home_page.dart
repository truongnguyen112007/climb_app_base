import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: tab[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
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
              height: 50,
              width: 80,
              margin: EdgeInsets.only(bottom: 25),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
              child: MaterialButton(
                child: Icon(
                  Icons.account_balance_rounded,
                  color: _currentIndex == 2 ? Colors.blue : Colors.white70,
                ),
                onPressed: () =>onTabTapped(2),
                splashColor: Colors.transparent,
              ),
            ),
          ),
        )
      ],
    );
    return Scaffold(
      body: tab[_currentIndex],
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 25),
        child: Container(
          width: 65,
          height: 65,
          child: FloatingActionButton(
            onPressed: () {
              onTabTapped(2);
            },
            child: Icon(Icons.heart_broken),
            backgroundColor: Colors.black,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}