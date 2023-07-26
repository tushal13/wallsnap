import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallsnap/controllers/api_controller.dart';
import 'package:wallsnap/views/screens/Detail_list_page.dart';
import 'package:wallsnap/views/screens/WallSnapPreview.dart';
import 'package:wallsnap/views/screens/Wallsnap.dart';
import 'views/screens/home_screen.dart';
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
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Medium',
          colorScheme: ColorScheme.light(
            primary: Colors.purple,
            secondary: Colors.lightBlue.shade400,
            brightness: Brightness.light,
          )),
      routes: {
        '/': (context) => const HomeScreen(),
        'Wall': (context) => const Detail_List(),
        'Search': (context) => const SearchPage(),
        'WallSnap': (context) => const WallSnap(),
        'WallSnapPreview': (context) => const WallSnapPreview(),
      },
    );
  }
}
