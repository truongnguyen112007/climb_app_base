import 'package:climb_app_base/components/text_style.dart';
import 'package:climb_app_base/utils/navigator_utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

final List<String> wallHeight = [
  '6m',
  '8m',
  '12m',
];

final List<String> holdSet = [
  'Standard',
  'Custom',
];

final List<String> itemCity = ['item1', 'item2', 'item3'];

class _FilterDialogState extends State<FilterDialog> {
  String? selectedValue = itemCity[0];

  int selectedHeight = 2;

  int selectedHold = 1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF212121),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        // height: size.height/3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 10.w, right: 20.w, top: 10.h, bottom: 7.h),
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
                  ),
                ),
                AppText(
                  msg: 'Removes Filter',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.white24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.w),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      customButton: Container(
                        height: 60.h,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              AppText(
                                msg: selectedValue ?? '',
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF212121),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.white60),
                        ),
                      ),
                      isExpanded: true,
                      items: itemCity
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Container(
                    color: Color(0xFF212121),
                    width: 40.w,
                    height: 15.h,
                    child: Center(child: AppText(msg: 'City',style: TextStyle(color: Colors.white60),)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h, left: 15.w, bottom: 15.h),
            child: AppText(
              msg: 'Wall Height',
              style: TextStyle(color: Colors.white70, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: ListFilterDialog(wallHeight, selectedHeight, (index) {
              selectedHeight = index;
              setState(() {});
            }),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h, left: 15.w, bottom: 15.h),
            child: AppText(
              msg: 'Holds set',
              style: TextStyle(color: Colors.white70, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
            child: ListFilterDialog(holdSet, selectedHold, (index) {
              selectedHold = index;
              setState(() {});
            }),
          ),
          Divider(
            thickness: 1,
            color: Colors.white24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
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
