import 'package:flutter/material.dart';

class TabRoutes extends StatefulWidget {
  const TabRoutes({Key? key}) : super(key: key);

  @override
  State<TabRoutes> createState() => _TabRoutesState();
}

class _TabRoutesState extends State<TabRoutes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Route Page',style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
