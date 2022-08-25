import 'package:flutter/material.dart';

class TabPersons extends StatefulWidget {
  const TabPersons({Key? key}) : super(key: key);

  @override
  State<TabPersons> createState() => _TabPersonsState();
}

class _TabPersonsState extends State<TabPersons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
    );
  }
}
