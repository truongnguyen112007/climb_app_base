import 'package:climb_app_base/components/gradient_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButtonNavigationBar extends StatefulWidget {
  final Function(int index) indexCallBack;

  const AppButtonNavigationBar({Key? key, required this.indexCallBack})
      : super(key: key);

  @override
  State<AppButtonNavigationBar> createState() => _AppButtonNavigationBarState();
}

class _AppButtonNavigationBarState extends State<AppButtonNavigationBar> {
  static const int TAB_HOME = 0;
  static const int TAB_ROUTES = 1;
  static const int TAB_CLIMB = 2;
  static const int TAB_RESERVATIONS = 3;
  static const int TAB_PROFILE = 4;
  var currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  itemBottomNavigationBar(Icons.home_filled, TAB_HOME, 'home'),
                  itemBottomNavigationBar(
                      Icons.map_outlined, TAB_ROUTES, 'Routes'),
                  const Expanded(child: SizedBox()),
                  itemBottomNavigationBar(
                      Icons.date_range_sharp, TAB_RESERVATIONS, 'Reservations'),
                  itemBottomNavigationBar(
                      Icons.person_outline_outlined, TAB_PROFILE, 'Profile'),
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
              padding: EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  currentTab = 2;
                  widget.indexCallBack(currentTab);
                  setState(() {});
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
                      child: GradientIcon(
                        size: 30,
                        icon: Icons.language_outlined,
                        gradient: LinearGradient(
                          colors: currentTab == TAB_CLIMB
                              ? [Colors.green, Colors.blue]
                              : [Colors.grey, Colors.grey],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Climb",
                        style: TextStyle(
                            color: currentTab == TAB_CLIMB
                                ? Colors.orange
                                : Colors.grey)),
                  ],
                ),
              ),
              width: 80,
              height: 90,
            ),
          ),
        ),
      ],
    );
  }

  Widget itemBottomNavigationBar(IconData icon, int index, String title) =>
      Expanded(
        child: InkWell(
          onTap: () {
            setState(() {
              currentTab = index;
              widget.indexCallBack(currentTab);
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientIcon(
                size: 20,
                icon: icon,
                gradient: LinearGradient(
                  colors: currentTab == index
                      ? [Colors.red, Colors.orange]
                      : [Colors.grey, Colors.grey],
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    color: currentTab == index ? Colors.orange : Colors.grey,
                    fontSize: 13.5),
              ),
            ],
          ),
        ),
      );
}
