import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('RECLIMB'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          SizedBox(
            width: 15,
          ),
          SizedBox(
            child: Badge(
              padding: EdgeInsets.all(2),
              position: BadgePosition.topEnd(top: 13, end: -2),
              toAnimate: false,
              badgeContent: Text('1'),
              child: Icon(Icons.notifications_none_sharp),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: size.height / 8,
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
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'NEXT CLIMB',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.add),
                          backgroundColor: Colors.yellow,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '12:00 Tuesday, 23th March',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Murall Krakowska, Warszawa',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              primary: false,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: size.height / 4,
                  decoration: BoxDecoration(color: Colors.blue),
                );
              },
              itemCount: 2,
              shrinkWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
