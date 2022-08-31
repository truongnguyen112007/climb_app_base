import 'package:climb_app_base/components/item_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/list_routes_model.dart';

class TabRouteSearch extends StatefulWidget {
  const TabRouteSearch({Key? key}) : super(key: key);

  @override
  State<TabRouteSearch> createState() => _TabRouteSearchState();
}

class _TabRouteSearchState extends State<TabRouteSearch> {
  var lRouteSearch = [
    RoutesModel(
        nameRoute: 'Adam',
        nameAuthor: 'AdamKowalski',
        rank: '4',
        height: '12m',
        date: '2022-05-02'),
    RoutesModel(
        nameRoute: 'Adam',
        nameAuthor: 'AdamKowalski',
        rank: '5C',
        height: '12m',
        date: '2022-05-02',
        status: 'OS'),
    RoutesModel(
        nameRoute: 'Adam',
        nameAuthor: 'AdamKowalski',
        rank: '5A',
        height: '12m',
        date: '2022-05-02',
        status: 'UF'),
    RoutesModel(
        nameRoute: 'Adam',
        nameAuthor: 'AdamKowalski',
        rank: '6A',
        height: '12m',
        date: '2022-05-02'),
    RoutesModel(
        nameRoute: 'Adam',
        nameAuthor: 'AdamKowalski',
        rank: '8A',
        height: '12m',
        date: '2022-05-02'),
    RoutesModel(
        nameRoute: 'Adam',
        nameAuthor: 'AdamKowalski',
        rank: '5C',
        height: '12m',
        date: '2022-05-02'),
    RoutesModel(
        nameRoute: 'Adam',
        nameAuthor: 'AdamKowalski',
        rank: '8B',
        height: '12m',
        date: '2022-05-02'),
    RoutesModel(
        nameRoute: 'Adam',
        nameAuthor: 'AdamKowalski',
        rank: '5A',
        height: '12m',
        date: '2022-05-02'),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox();
    return Container(
      height: size.height,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 10),
        itemBuilder: (BuildContext context, int index) {
          return ItemRoutes(model: lRouteSearch[index]);
        },
        itemCount: lRouteSearch.length,
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 10.h,
        ),
      ),
      color: Color(0xFF3B4244),
    );
  }
}
