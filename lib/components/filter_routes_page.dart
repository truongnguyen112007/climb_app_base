import 'package:climb_app_base/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tags/flutter_tags.dart';
import '../utils/navigator_utils.dart';

class FilterRoutes extends StatefulWidget {
  const FilterRoutes({Key? key}) : super(key: key);

  @override
  State<FilterRoutes> createState() => _FilterRoutesState();
}

final List<String> status = [
  'Not tried',
  'UF-Unfinished',
  'SU-Supported',
  'TR-Top-rope',
  'RP-Red Point',
  'OS-OnSight',
];

final List<String> corners = ['With corners', 'Without corners'];

final List<String> designs = ["Route setter", 'Friends'];

class _FilterRoutesState extends State<FilterRoutes> {
  int selectedStatus = 0;

  int selectedCorner = 0;

  int selectedDesign = 0;

  RangeValues _currentRangeValues1 =  RangeValues(40, 80);
  RangeValues _currentRangeValues2 =  RangeValues(40, 80);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF212121),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 10.w, right: 20.w, bottom: 10.h, top: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      NavigatorUtils.back(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: AppText(
                      msg: 'Removes Filter',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white24,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: TextFormField(
                style: TextStyle(color: Colors.white60),
                cursorColor: Colors.white60,
                decoration: InputDecoration(
                  labelText: 'Author',
                  labelStyle: TextStyle(color: Colors.white60),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            textFilter("Status"),
            Padding(
              padding: EdgeInsets.all(10.h),
              child: Tags(
                columns: 2,
                itemCount: status.length,
                alignment: WrapAlignment.start,
                itemBuilder: (int index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white24,
                  ),
                  child: Text(
                    status[index],
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, bottom: 10.h, top: 10.h),
                ),
              ),
            ),
            textFilter("Corners"),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              child: ListFilterDialog(corners, selectedCorner, (index) {
                selectedCorner = index;
                setState(() {});
              }),
            ),
            textFilter("Author's grade"),
            RangeSlider(
                activeColor: Colors.deepOrange,
                inactiveColor: Colors.white24,
                values: _currentRangeValues1,
                max: 100,
                labels: RangeLabels(
                  _currentRangeValues1.start.round().toString(),
                  _currentRangeValues1.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues1 = values;
                  });
                }),
            textFilter("User's grade"),
            RangeSlider(
              activeColor: Colors.deepOrange,
                inactiveColor: Colors.white24,
                values: _currentRangeValues2,
                max: 100,
                labels: RangeLabels(
                  _currentRangeValues2.start.round().toString(),
                  _currentRangeValues2.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues2 = values;
                  });
                }),
            textFilter('Designed by'),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 15.h),
              child: ListFilterDialog(designs, selectedDesign, (index) {
                selectedDesign = index;
                setState(() {});
              }),
            ),
            Divider(
              thickness: 1,
              color: Colors.white24,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
              child: MaterialButton(
                color: Colors.deepOrange,
                height: 40.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      msg: 'Show results:',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    AppText(
                      msg: '25',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFilter(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: AppText(
        msg: text,
        style: TextStyle(color: Colors.white60, fontSize: 20),
      ),
    );
  }

  Widget ListFilterDialog(
      List nameList, int select, Function(int) onCallBackSelect) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 18.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: nameList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                onCallBackSelect(index);
              });
            },
            child: Container(
              padding: EdgeInsets.only(left: 17.w, right: 17.w),
              margin: EdgeInsets.only(left: 15.w),
              alignment: Alignment.center,
              decoration: select == index
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.orange, Colors.red],
                      ),
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white24),
              child: Text(
                nameList[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
