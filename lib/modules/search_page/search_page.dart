import 'package:climb_app_base/components/text_style.dart';
import 'package:climb_app_base/data/event_bus/hide_map_event.dart';
import 'package:climb_app_base/modules/search_page/tab_all.dart';
import 'package:climb_app_base/modules/search_page/tab_persons.dart';
import 'package:climb_app_base/modules/search_page/tab_places.dart';
import 'package:climb_app_base/modules/search_page/tab_routes.dart';
import 'package:climb_app_base/utils/app_utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/navigator_utils.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

final List<String> search = [
  'All',
  'Places',
  'Routes',
  'Persons',
];

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

class _SearchPageState extends State<SearchPage> {
  String? selectedValue = itemCity[0];
  var isShowMap = false;
  int selectedIndex = 1;
  TextEditingController? textEditingController;
  var pageController = PageController(initialPage: 1);

  @override
  void initState() {
    pageController.addListener(() {
      var newPage = pageController.page!.round();
      if (newPage != selectedIndex) {
        setState(() {
          selectedIndex = newPage;
        });
      }
    });
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20.h),
            color: Colors.black,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 10.w,
                      right: 10.w,
                      left: 10.w),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          NavigatorUtils.back(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
                          autofocus: true,
                          cursorColor: Colors.deepOrange,
                          cursorHeight: 25.h,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: Colors.white24,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Icon(
                                Icons.search_outlined,
                                color: Colors.white,
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                clearText();
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: size.height / 19.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: search.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          pageController.jumpToPage(index);
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 17.w, right: 17.w),
                          margin: EdgeInsets.only(left: 6.w),
                          alignment: Alignment.center,
                          decoration: selectedIndex == index
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
                            search[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.white24,
                ),
                isShowMap
                    ? Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            filterDialog(context);
                            Utils.fireEvent(
                              HideMapEvent(),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.filter_alt_outlined,
                                color: Colors.white,
                              ),
                              AppText(
                                msg: 'Filter',
                                style: TextStyle(color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                          right: 15.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.swap_vert,
                                    color: Colors.white,
                                  ),
                                  AppText(
                                    msg: 'Sort',
                                    style: TextStyle(color: Colors.white54),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.filter_alt_outlined,
                                    color: Colors.white,
                                  ),
                                  AppText(
                                    msg: 'Filter',
                                    style: TextStyle(color: Colors.white54),
                                  )
                                ],
                              ),
                            ),
                            AppText(
                              msg: 'Select',
                              style: TextStyle(color: Colors.white54),
                            )
                          ],
                        ),
                      ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                TabAll(),
                TabPlaces(
                  onCallBackShowMap: (isShowMap) {
                    this.isShowMap = isShowMap;
                    setState(() {});
                  },
                ),
                TabRouteSearch(),
                TabPersons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void filterDialog(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0xFF212121),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            // height: size.height/3,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 10.w, right: 20.w, top: 15.h, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
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
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    customButton: Container(
                      height: 40.h,
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          AppText(
                            msg: selectedValue ?? '',
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1, color: Colors.red)),
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
              AppText(msg: ''),
              Row(
                children: [],
              )
            ],
          ),
        );
      },
    );
  }

  void clearText() {
    textEditingController?.text = '';
    setState(() {});
  }
}
