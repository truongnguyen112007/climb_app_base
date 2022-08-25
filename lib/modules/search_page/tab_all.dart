import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabAll extends StatefulWidget {
  const TabAll({Key? key}) : super(key: key);

  @override
  State<TabAll> createState() => _TabAllState();
}

class _TabAllState extends State<TabAll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.blue,
    );
  }
}
