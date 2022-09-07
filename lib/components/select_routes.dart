import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectRoutes extends StatefulWidget {
  const SelectRoutes({Key? key}) : super(key: key);

  @override
  State<SelectRoutes> createState() => _SelectRoutesState();
}

class _SelectRoutesState extends State<SelectRoutes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF212121),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          itemSelect(Icons.thumb_up_alt, "Move to playlist top"),
          itemSelect(Icons.account_balance_rounded, "Add to playlist"),
          itemSelect(Icons.add, "Remove from playlist"),
          itemSelect(Icons.account_box, "Add to favorite"),
          itemSelect(Icons.ac_unit, "Remove from favorite"),
          itemSelect(Icons.ac_unit, "Share"),
          itemSelect(Icons.ac_unit, "Copy"),
          itemSelect(Icons.ac_unit, "Edit"),
          itemSelect(Icons.ac_unit, "Delete")
        ],
      ),
    );
  }

  Widget itemSelect(IconData icon, String text) {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, top:10.h, bottom: 10.h),
      child: Row(
        children: [
          Icon(icon,color: Colors.white,),
          SizedBox(width: 30.w,),
          Text(text,style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}
