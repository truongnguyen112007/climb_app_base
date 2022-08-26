import 'package:climb_app_base/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/list_places_model.dart';

class ItemPlaces extends StatefulWidget {
  final PlacesModel model;

  const ItemPlaces({Key? key, required this.model}) : super(key: key);

  @override
  State<ItemPlaces> createState() => _ItemPlacesState();
}

class _ItemPlacesState extends State<ItemPlaces> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Container(
        height: size.height / 8,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: Row(
            children: [
              Container(
                height: 55.h,
                width: 55.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.yellow),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.model.namePlace,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.model.nameCity,
                        style: TextStyle(color: Colors.white54, fontSize: 17),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(
                        Icons.brightness_1_rounded,
                        color: Colors.white54,
                        size: 8,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        widget.model.distance.toString(),
                        style: TextStyle(color: Colors.white54, fontSize: 17),
                      ),
                      AppText(
                        msg: 'km',
                        style: TextStyle(color: Colors.white54, fontSize: 17),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
