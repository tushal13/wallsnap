import 'package:flutter/material.dart';
import 'package:wallsnap/views/screens/Collection_page.dart';
import 'package:wallsnap/views/screens/Popular_page.dart';
import 'package:wallsnap/views/screens/Random.dart';
import 'package:wallsnap/views/screens/WallSna_page.dart';
import 'package:wallsnap/views/screens/featuraed_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 2,
      length: 5,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) => [
          SliverAppBar(
            title: const Text("WallSnap's"),
            pinned: true,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('Search');
                  },
                  icon: Icon(Icons.search))
            ],
            expandedHeight: 130,
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
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
        ],
        body: TabBarView(
          controller: tabController,
          children: const [
            Collectione_Page(),
            WallSnap_Page(),
            Featured_WallSnap_Page(),
            Popular_WallSnap_Page(),
            Random_WallSnap_Page(),
          ],
        ),
      ),
    );
  }
}
