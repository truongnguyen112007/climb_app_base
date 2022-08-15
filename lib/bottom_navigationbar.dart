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
 static const int TAB_HOME =0;
 static  const int TAB_A =1;
 static const int TAB_B =2;
 static  const int TAB_C =3;
 static const int TAB_D =4;
  var currentTab =0;
  @override
  Widget build(BuildContext context) {
    return      Stack(
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
                      Icons.map_outlined, TAB_A, 'Routes'),
                  const Expanded(child: SizedBox()),
                  itemBottomNavigationBar(
                      Icons.date_range_sharp, TAB_C, 'Resevations'),
                  itemBottomNavigationBar(
                      Icons.person_outline_outlined, TAB_D, 'Profile'),
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
                  widget.indexCallBack(currentTab);
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
                    Text("Climb", style: TextStyle(color: currentTab==TAB_B ? Colors.red : Colors.grey)),
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
