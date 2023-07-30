import 'package:flutter/material.dart';

class WallSnapLockScreenPreview extends StatelessWidget {
  const WallSnapLockScreenPreview({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            data['largeImageURL'],
            fit: BoxFit.fill,
            height: double.infinity,
          ),
          Center(
            child: Image.asset(
              "assets/images/LockScreenFrame.png",
              fit: BoxFit.fill,
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
