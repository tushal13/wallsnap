import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallsnap/utility/Color_list.dart';

import '../../controllers/api_controller.dart';
import '../../utility/category_list.dart';

class Collectione_Page extends StatelessWidget {
  const Collectione_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Colors',
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 2,
                  fontFamily: 'RBold',
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: colorsList
                      .map((e) => GestureDetector(
                            onTap: () {
                              Provider.of<Apicontroller>(context, listen: false)
                                  .Search(val: e.name);
                              Navigator.of(context)
                                  .pushNamed('Wall', arguments: e.name);
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(8),
                                  height: 70,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.8),
                                        spreadRadius: 1,
                                        blurRadius: 0.5,
                                      ),
                                    ],
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    width: 72,
                                    height: 72,
                                    decoration: BoxDecoration(
                                      color: e.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Text(
                                  e.name,
                                  style: TextStyle(
                                      fontFamily: 'PMedium', fontSize: 14),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Categories',
                style: TextStyle(
                  fontFamily: 'RBold',
                  fontSize: 24,
                  letterSpacing: 2,
                ),
              ),
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: categories
                      .map((e) => GestureDetector(
                            onTap: () {
                              Provider.of<Apicontroller>(context, listen: false)
                                  .Search(val: e.name);
                              Navigator.of(context)
                                  .pushNamed('Wall', arguments: e.name);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              height: 210,
                              width: 380,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                  image: NetworkImage(e.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${e.name}",
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
