import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:wallsnap/views/screens/WallSnapSetting.dart';
import 'package:wallsnap/views/screens/no_internet.dart';
import 'package:wallsnap/views/screens/search_page.dart';
import 'package:wallsnap/views/screens/tab_Screen.dart';

import '../../controllers/Connectivity_controller.dart';
import '../../controllers/api_controller.dart';
import 'about_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  final List<Widget> screens = [
    TabScreen(),
    SearchPage(),
    WallSnapSetting(),
    ABOUTPAGE(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ConnectivityController>(builder: (context, pro, _) {
        return StreamBuilder(
          stream: pro.isconnected.onConnectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.data == ConnectivityResult.mobile) {
              Future.delayed(Duration(seconds: 5), () {
                pro.isConnectivity();
                print('mobile${pro.isConnectivity().toString()}');
              });
            } else if (snapshot.data == ConnectivityResult.wifi) {
              Future.delayed(Duration(seconds: 5), () {
                pro.isConnectivity();
                print('wifi-${pro.isConnectivity().toString()}');
              });
              return !pro.hasInternetConnection
                  ? Center(
                      child: Image.asset(
                        'assets/images/video-unscreen.gif',
                        color: Colors.purple,
                        height: 100,
                      ),
                    )
                  : screens[currentIndex];
            } else if (snapshot.data == ConnectivityResult.none) {
              Future.delayed(Duration(seconds: 5), () {
                pro.noConnectivity();
                print('none-${pro.noConnectivity().toString()}');
              });
              return Center(
                // on connectivitybreck
                child: pro.hasInternetConnection
                    ? Center(
                        child: Image.asset(
                          'assets/images/video-unscreen.gif',
                          color: Colors.purple,
                          width: 150,
                        ),
                      )
                    : NOINTERNET(),
              );
            }
            return !pro.hasInternetConnection
                ? Center(
                    child: Image.asset(
                      'assets/images/video-unscreen.gif',
                      color: Colors.purple,
                      height: 100,
                    ),
                  )
                : screens[currentIndex];
          },
        );
      }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15, top: 2, bottom: 9),
        child: GNav(
          gap: 6,
          backgroundColor: Provider.of<Apicontroller>(context).isDark
              ? Colors.transparent.withOpacity(0)
              : Colors.transparent.withOpacity(0),
          activeColor: Provider.of<Apicontroller>(context).isDark
              ? Colors.white
              : Colors.black,
          tabBackgroundColor: Colors.purple,
          padding: EdgeInsets.all(16),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
            ),
            GButton(
              icon: Icons.attribution_rounded,
              text: 'About',
            ),
          ],
          selectedIndex: currentIndex,
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
