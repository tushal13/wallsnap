import 'package:flutter/material.dart';
import 'package:wallsnap/views/screens/Collection_page.dart';
import 'package:wallsnap/views/screens/Popular_page.dart';
import 'package:wallsnap/views/screens/Random.dart';
import 'package:wallsnap/views/screens/WallSna_page.dart';
import 'package:wallsnap/views/screens/featuraed_page.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 1;

  final List titles = [
    "COLLECTION",
    "WALLSNAP",
    "FEATURED",
    "POPULAR",
    "RANDOM",
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: currentIndex,
      length: 5,
      vsync: this,
    );
    tabController.addListener(handleTabChange);
  }

  handleTabChange() {
    setState(() {
      currentIndex = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: currentIndex % 2 == 0
                ? Container(
                    padding: EdgeInsets.only(left: 18),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/A2.png',
                          color: Colors.purple,
                        ),
                        Image.asset('assets/images/A1.png'),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(left: 18),
                    child: Row(
                      children: [
                        Image.asset('assets/images/A1.png'),
                        Image.asset('assets/images/A2.png',
                            color: Colors.purple),
                      ],
                    ),
                  ),
            title: Text(
              '${titles[currentIndex]}',
              style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey),
            ),
            pinned: true,
            floating: true,
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              tabs: [
                Tab(
                  icon: Icon(Icons.menu_sharp),
                ),
                Tab(
                  icon: Icon(Icons.ac_unit),
                ),
                Tab(
                  icon: Icon(Icons.local_fire_department),
                ),
                Tab(
                  icon: Icon(Icons.star_rounded),
                ),
                Tab(
                  icon: Icon(Icons.history),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: tabController,
              children: [
                Collectione_Page(),
                WallSnap_Page(),
                Featured_WallSnap_Page(),
                Popular_WallSnap_Page(),
                Random_WallSnap_Page(),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.withOpacity(0.5),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
