import 'package:climb_app_base/components/text_style.dart';
import 'package:climb_app_base/data/feed_model.dart';
import 'package:climb_app_base/modules/search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/item_feed.dart';
import '../../utils/navigator_utils.dart';

class TabHome extends StatefulWidget {

  const TabHome({Key? key}) : super(key: key);

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  final controller = ScrollController();
  var listInfo = [
    FeedModel(true,
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    FeedModel(false, '', photoURL: 'assets/images/img.png'),
  ];

  bool loading = false;

  bool readEnd = false;

  int nextPage = 0;

  @override
  void initState() {
    listInfo.addAll([
      FeedModel(true,
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
      FeedModel(false, '', photoURL: 'assets/images/img.png'),
    ]);
    super.initState();
    controller.addListener(() {
      var maxScroll = controller.position.maxScrollExtent;
      var currentScroll = controller.position.pixels;
      if (maxScroll - currentScroll <= 200 && loading == false && !readEnd) {
        fetch();
      }
    });
  }

  Future fetch() async {
    loading = true;
    setState(() {});
    await Future.delayed(
      Duration(milliseconds: 2500),
    );
    setState(() {
      loading = false;
      listInfo.addAll([
        FeedModel(true,
            'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
        FeedModel(false,'', photoURL: 'assets/images/img.png'),
      ]);
      nextPage++;
      if (nextPage == 2) {
        readEnd = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF3B4244),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('RECLIMB'),
        actions: [
          IconButton(
            onPressed: () {
              NavigatorUtils.moveBottomToTop(
                  SearchPage(),
                  context);
            },
            icon: Icon(Icons.search),
          ),
          SizedBox(
            width: 15.w,
          ),
          SizedBox(
            child: Badge(
              padding: EdgeInsets.all(2),
              position: BadgePosition.topEnd(top: 13.h, end: -2.h),
              toAnimate: false,
              badgeContent: Text('1'),
              child: Icon(Icons.notifications_none_sharp),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: controller,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: size.height / 8,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.orange, Colors.red],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'NEXT CLIMB',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  msg: '12:00 Tuesday, 23th March',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400),
                                  maxLine: 1,
                                ),
                                AppText(
                                  msg: 'Murall Krakowska, Warszawa',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp),
                                  maxLine: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              primary: true,
              itemBuilder: (BuildContext context, int index) {
                if (index < listInfo.length) {
                  return ItemFeed(model: listInfo[index]);
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                );
              },
              itemCount: loading ? listInfo.length + 1 : listInfo.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemListView(Size size, FeedModel model) => ItemFeed(
        model: model,
      );
}
