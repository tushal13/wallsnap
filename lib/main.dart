import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallsnap/views/screens/Homescreen.dart';
import 'package:wallsnap/views/screens/SpleshScreen.dart';
import 'controllers/api_controller.dart';
import 'utility/Theme/themes.dart';
import 'views/screens/Detail_list_page.dart';
import 'views/screens/WallSnapHomePreview.dart';
import 'views/screens/WallSnapLockScreenPreview.dart';
import 'views/screens/WallSnapSetting.dart';
import 'views/screens/Wallsnap.dart';
import 'views/screens/search_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Apicontroller(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WallSnap',
      theme: Apptheme.lightTheme,
      routes: {
        '/': (context) => const SPLASH_SCREEN(),
        'Home': (context) => const HomeScreen(),
        'Setting': (context) => const WallSnapSetting(),
        'Wall': (context) => const Detail_List(),
        'Search': (context) => const SearchPage(),
        'WallSnap': (context) => const WallSnap(),
        'HomeScreenPreview': (context) => const WallSnapHomeScreenPreview(),
        'LockScreenPreview': (context) => const WallSnapLockScreenPreview(),
      },
    );
  }
}
