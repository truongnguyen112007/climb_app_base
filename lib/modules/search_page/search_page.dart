import 'package:climb_app_base/components/text_style.dart';
import 'package:climb_app_base/modules/search_page/tab_all.dart';
import 'package:climb_app_base/modules/search_page/tab_persons.dart';
import 'package:climb_app_base/modules/search_page/tab_places.dart';
import 'package:climb_app_base/modules/search_page/tab_routes.dart';
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

class _SearchPageState extends State<SearchPage> {

  int selectedIndex = 1;
  TextEditingController? textEditingController;
  var pageController = PageController(initialPage: 1);

  @override
  void initState() {
    pageController.addListener(() {
     var newPage = pageController.page!.round();
     if(newPage != selectedIndex){
       setState((){
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
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                color: Colors.black,
                height: size.height / 3.7,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 45.h, right: 10.w, left: 10.w),
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
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
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
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15.w,
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
                  controller: pageController,
                  children: [
                    TabAll(),
                    TabPlaces(),
                    TabRouteSearch(),
                    TabPersons(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void clearText() {
    textEditingController?.text = '';
    setState(() {});
  }
}
