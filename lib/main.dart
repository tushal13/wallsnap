import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallsnap/controllers/intro_screen_controller.dart';
import 'package:wallsnap/views/screens/Homescreen.dart';
import 'package:wallsnap/views/screens/Splash_Screen.dart';
import 'controllers/Connectivity_controller.dart';
import 'controllers/Wallpaper_controller.dart';
import 'controllers/api_controller.dart';
import 'utility/Theme/themes.dart';
import 'views/screens/Detail_list_page.dart';
import 'views/screens/WallSnapHomePreview.dart';
import 'views/screens/WallSnapLockScreenPreview.dart';
import 'views/screens/WallSnapSetting.dart';
import 'views/screens/Wallsnap.dart';
import 'views/screens/intro_screen.dart';
import 'views/screens/search_page.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences Pref = await SharedPreferences.getInstance();

  bool isIntro = Pref.getBool("isIntro") ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Apicontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConnectivityController(),
        ),
        ChangeNotifierProvider(
          create: (context) => WallController(),
        ),
        ChangeNotifierProvider(
          create: (context) => IntroScreenController(isIntro: isIntro),
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
    return Sizer(builder: (context, _, __) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WallSnap',
        theme: Provider.of<Apicontroller>(context).isDark
            ? Apptheme.DarkTheme
            : Apptheme.lightTheme,
        routes: {
          '/': (context) => const SPLASH_SCREEN(),
          'IntroScreen': (context) => const IntroScreen(),
          'Home': (context) => const HomeScreen(),
          'Setting': (context) => const WallSnapSetting(),
          'Wall': (context) => const Detail_List(),
          'Search': (context) => const SearchPage(),
          'WallSnap': (context) => const WallSnap(),
          'HomeScreenPreview': (context) => const WallSnapHomeScreenPreview(),
          'LockScreenPreview': (context) => const WallSnapLockScreenPreview(),
        },
      );
    });
  }
}
