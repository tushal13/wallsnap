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

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 1,
      length: 5,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                'WallSnap',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'FunCity',
                  fontSize: 28,
                ),
              ),
            ),
            pinned: true,
            floating: true,
            expandedHeight: 150,
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              tabs: const [
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
    );
  }
}
