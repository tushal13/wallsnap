import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wallsnap/controllers/intro_screen_controller.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Page = [
      Container(
        color: Color(0xFFffffff),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 150,
              ),
              Image.asset('assets/images/Logo.png'),
              const SizedBox(
                height: 80,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'you are one of the first \nto try it out!'.toUpperCase(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "The app was re-written from scratch, I've selected a \nsmall portion of users to try it out. You are among those \nusers!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Light'),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Please be kind as the app might be a little rough on its \nedges. if you find any bugs, please reach out to me on \nGmail-tushalgopani003@gmail.com",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Light'),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
      Container(
        color: Color(0xFFe6e6e6),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 150,
              ),
              Lottie.network(
                'https://lottie.host/743a8eea-6209-4aee-84d6-cd0da4924294/tNocQFhzp7.json',
              ),
              const SizedBox(
                height: 110,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "The Only wallpapwe app\nyou'll ever need.".toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          wordSpacing: 2,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Hi! Welcome to WallSnap 2.0 \nit was a lot of work to make this new version a reality, I\nhope you enjoy this new iteration!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Light'),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Thanks to all of those who donated in the previous\nversion.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Light'),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
      GestureDetector(
        onDoubleTap: () {
          Navigator.of(context).pushNamed('Home');
        },
        child: Container(
          color: Color(0xFF6c6c6c),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 42,
                    ),
                    Lottie.network(
                      'https://lottie.host/8838b789-c2c1-400f-aa69-0972dd2aaa76/k5J86cjYoU.json',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Lottie.network(
                        'https://lottie.host/4ffff3a8-fba2-47ec-9b30-4fb1a24ef188/dbX7dG7Hed.json'),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "So, what's new?".toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            wordSpacing: 2,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "A refreshed UI, faster wallpaper downloads, user\nprofile view, a ton of bug fixes and performance \nimprovements! I'll let you discover it all for yourself.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Light'),
                      ),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "More features like wallpaper editing are coming, stay \ntuned!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Light'),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    ];
    return Scaffold(
      body: LiquidSwipe(
        pages: Page,
        waveType: WaveType.liquidReveal,
      ),
    );
  }
}
