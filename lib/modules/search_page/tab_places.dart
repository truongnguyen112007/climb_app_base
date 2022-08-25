
import 'package:climb_app_base/components/item_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/text_style.dart';
import '../../data/list_places_model.dart';

class TabPlaces extends StatefulWidget {
  const TabPlaces({Key? key}) : super(key: key);

  @override
  State<TabPlaces> createState() => _TabPlacesState();
}

class _TabPlacesState extends State<TabPlaces> {
  var lPlaces = [
    ListPlacesModel(
        namePlace: 'Hardwalls',
        nameCity: 'Warsaw',
        distance: 2.2,
        lat: 21.0484124195535,
        lng: 105.80959985686454),
    ListPlacesModel(
        namePlace: 'AAAAAA',
        nameCity: 'aaa',
        distance: 3.2,
        lat: 21.061288097479334,
        lng: 105.80934959954087),
    ListPlacesModel(
        namePlace: 'BBBBBB',
        nameCity: 'bbb',
        distance: 4.2,
        lat: 21.079085115322442,
        lng: 105.8124170251354),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: /*Color(0xFF282D2F)*/Colors.blue,
      child: Stack(
        children: [
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10),
            itemBuilder: (BuildContext context, int index){
              return ItemPlaces();
            }, separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 10.h,), itemCount:1,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20.h),
            alignment: Alignment.bottomCenter,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(color: Colors.deepOrange, width: 1),
                ),
                fixedSize: MaterialStateProperty.all(
                  Size(100.w, 35.h),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.deepOrange,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  AppText(
                    msg: 'Map',
                    style: TextStyle(color: Colors.deepOrange),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
