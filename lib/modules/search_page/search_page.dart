import 'package:climb_app_base/components/filter_routes_page.dart';
import 'package:climb_app_base/components/select_routes.dart';
import 'package:climb_app_base/components/text_style.dart';
import 'package:climb_app_base/data/event_bus/hide_map_event.dart';
import 'package:climb_app_base/modules/search_page/tab_all.dart';
import 'package:climb_app_base/modules/search_page/tab_persons.dart';
import 'package:climb_app_base/modules/search_page/tab_places.dart';
import 'package:climb_app_base/modules/search_page/tab_routes.dart';
import 'package:climb_app_base/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/filter_dialog.dart';
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

class _SearchPageState extends State<SearchPage> {
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
                            hintText: 'Find places, route, climbs',
                            hintStyle: TextStyle(color: Colors.white30),
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
                            if(isShowMap){
                              isShowMap = false;
                            }
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
                            isShowMap = false;
                           if(mounted) setState((){});
                            showModalBottomSheet<void>(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return FilterDialog();
                              },
                            );
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
                              onTap: () {
                                 return filterOnClick();
                              },
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
                            InkWell(
                              onTap: (){
                                return selectOnClick();
                              },
                              child: AppText(
                                msg: 'Select',
                                style: TextStyle(color: Colors.white54),
                              ),
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

  void clearText() {
    textEditingController?.text = '';
    setState(() {});
  }

 void filterOnClick (){
      switch (selectedIndex){
        case 0 :
        break;
        case 1 :
        {
          showModalBottomSheet<void>(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return FilterDialog();
            },
          );
          break;
        }
        case 2 :
          {
            NavigatorUtils.moveBottomToTop(FilterRoutes(), context);
          }
          break;
        case 3:
          break;
      }
  }

  void selectOnClick (){
    switch (selectedIndex) {
      case 0 :
        break;
      case 1 :
        break;
      case 2 :
        showModalBottomSheet(
          context: context,isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              maxChildSize: 0.7,
              builder:
                  (BuildContext context, ScrollController scrollController) =>
                      SelectRoutes(),
            );
          },
        );
        break;
      case 3:
        break;
    }
  }
}
