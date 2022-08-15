import 'package:flutter/material.dart';

class ClimbPage extends StatefulWidget {
  const ClimbPage({Key? key}) : super(key: key);

  @override
  State<ClimbPage> createState() => _ClimbPageState();
}

class _ClimbPageState extends State<ClimbPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Climb Page',style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
