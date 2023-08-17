import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallsnap/controllers/intro_screen_controller.dart';

class SPLASH_SCREEN extends StatefulWidget {
  const SPLASH_SCREEN({Key? key}) : super(key: key);

  @override
  State<SPLASH_SCREEN> createState() => _SPLASH_SCREENState();
}

class _SPLASH_SCREENState extends State<SPLASH_SCREEN> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('IntroScreen');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset(
            'assets/images/splesh.png',
          ),
          width: 130,
          height: 130,
          decoration: BoxDecoration(
              color: Colors.white70.withOpacity(0.9),
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                    offset: Offset(2, 2),
                    color: Colors.grey,
                    spreadRadius: 0.8,
                    blurRadius: 0.8)
              ]),
        ),
      ),
    );
  }
}
