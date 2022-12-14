import 'package:climb_app_base/modules/tab_home/tab_home.dart';
import 'package:flutter/material.dart';
import '../../bottom_navigationbar.dart';
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
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1), child: Scaffold(
      body: Stack(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: tabs,
            ),
          ),
          Positioned.fill(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: AppButtonNavigationBar(
                  indexCallBack: (int index) => jumtToPage(index),
                ),
              ))
        ],
      ),
    ));
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: tabs,
            ),
          ),
          Positioned.fill(
              child: Container(
            alignment: Alignment.bottomCenter,
            child: AppButtonNavigationBar(
              indexCallBack: (int index) => jumtToPage(index),
            ),
          ))
        ],
      ),
    );
  }

  void jumtToPage(int index) => pageController.animateToPage(index,
      duration: Duration(milliseconds: 500),
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
                style: TextStyle(
                    color: currentTab == index ? Colors.orange : Colors.grey),
              ),
            ],
          ),
        ),
      );
}
