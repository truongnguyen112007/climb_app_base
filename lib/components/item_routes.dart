import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/list_routes_model.dart';

class ItemRoutes extends StatefulWidget {
  final RoutesModel model;

  const ItemRoutes({Key? key, required this.model}) : super(key: key);

  @override
  State<ItemRoutes> createState() => _ItemRoutesState();
}

class _ItemRoutesState extends State<ItemRoutes> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Container(
        height: size.height/8,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20),),
      ),
    );
  }
}
