import 'package:climb_app_base/components/text_style.dart';
import 'package:climb_app_base/data/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/item_feed.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  final controller = ScrollController();
  var listInfo = [
    FeedModel(true,
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
    FeedModel(false, '', photoURL: 'assets/images/img.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF282D2F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('RECLIMB'),
        actions: [
          IconButton(
            onPressed: () {},
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
                return SizedBox(height: 10.h,width: 20.w,child: CircularProgressIndicator(
                ),);
              },
              // itemListView(size, listInfo[index]),
              itemCount: listInfo.length + 1,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 1,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemListView(Size size, FeedModel model) => ItemFeed(
        model: model,
      );
}
