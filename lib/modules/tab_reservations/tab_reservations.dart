import 'package:flutter/material.dart';

class TabReservations extends StatefulWidget {
  const TabReservations({Key? key}) : super(key: key);

  @override
  State<TabReservations> createState() => _TabReservationsState();
}

class _TabReservationsState extends State<TabReservations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Reservations Page',style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
