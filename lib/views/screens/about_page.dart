import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/api_controller.dart';

class ABOUTPAGE extends StatelessWidget {
  const ABOUTPAGE({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("Home");
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.grey,
          ),
        ),
        backgroundColor: Provider.of<Apicontroller>(context).isDark
            ? Colors.transparent.withOpacity(0)
            : Colors.white,
        title: Text(
          'About',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/About.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/splesh.png',
                    ),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white70.withOpacity(0.8),
                        border: Border.all(width: 1, color: Colors.grey),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2, 2),
                              color: Colors.grey,
                              spreadRadius: 0.2,
                              blurRadius: 0.3)
                        ]),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'WallSnap',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'FunCity',
                    ),
                  ),
                  Text(
                    'v1,0,1',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'RBold',
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'This is an open-source project and can be found on ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'RBold',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'GitHub',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'RBold',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '          if you liked my work\n   show some ♥️and⭐the repo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'RBold',
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    'Made with♥️by Tushal Gopani',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'RBold',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
