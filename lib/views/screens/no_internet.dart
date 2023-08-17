import 'package:flutter/material.dart';

class NOINTERNET extends StatelessWidget {
  const NOINTERNET({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Image.asset(
              'assets/images/bored-cat-5200596-4341011.gif',
              width: 300,
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              'No Internet Connection Found',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
