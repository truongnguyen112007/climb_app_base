import 'package:flutter/material.dart';

class ItemPlaces extends StatefulWidget {
  const ItemPlaces({Key? key}) : super(key: key);

  @override
  State<ItemPlaces> createState() => _ItemPlacesState();
}

class _ItemPlacesState extends State<ItemPlaces> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height/8,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30)
        ),
      ),
    );
  }
}
