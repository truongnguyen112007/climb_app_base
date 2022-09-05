import 'package:climb_app_base/components/text_style.dart';
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
        height: size.height / 8,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: backGroundItem(widget.model.rank)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                msg: widget.model.rank,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      AppText(
                        msg: widget.model.nameRoute,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      AppText(
                        msg: widget.model.date,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AppText(
                        msg: 'Route',
                        style: TextStyle(color: Colors.white60, fontSize: 16),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      AppText(
                        msg: widget.model.height,
                        style: TextStyle(color: Colors.white60, fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: Icon(
                          Icons.circle_sharp,
                          color: Colors.white60,
                          size: 8,
                        ),
                      ),
                      AppText(
                        msg: widget.model.nameAuthor,
                        style: TextStyle(color: Colors.white60, fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
              widget.model.status == null
                  ? SizedBox()
                  : Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: AppText(msg: widget.model.status!,style: TextStyle(color: Color(0xFF015927)),),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> backGroundItem(String value) {
    switch (value) {
      case '4':
        return [Color(0xFF015927), Color(0xFF015927)];
      case '5A':
        return [
          Color(0xFFd07802),
          Color(0xFF015927),
          Color(0xFF015927),
          Color(0xFF015927),
          Color(0xFF015927)
        ];
      case '5C':
        return [Color(0xFFd07802), Color(0xFF015927), Color(0xFF015927)];
      case '6A':
        return [Color(0xFFd07802), Color(0xFF015927), Color(0xFF015927)];
      default:
        return [
          Color(0xFFd10000),
          Color(0xFFd10000),
          Color(0xFFd10000),
          Colors.orange
        ];
    }
  }
}
