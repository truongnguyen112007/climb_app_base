import 'package:flutter/material.dart';

class TabClimb extends StatefulWidget {
  const TabClimb({Key? key}) : super(key: key);

  @override
  State<TabClimb> createState() => _TabClimbState();
}

class _TabClimbState extends State<TabClimb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Climb Page',style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
