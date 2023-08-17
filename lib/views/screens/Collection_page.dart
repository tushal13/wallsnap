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
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Colors',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ColorsList.map((e) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Provider.of<Apicontroller>(context, listen: false)
                                .Search(val: e.name);
                            Navigator.of(context)
                                .pushNamed('Wall', arguments: e.name);
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                                color: e.color,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2, 2),
                                      color: Colors.grey,
                                      spreadRadius: 0.8,
                                      blurRadius: 0.8)
                                ]),
                          ),
                        ),
                        Text(e.name),
                      ],
                    )).toList(),
              ),
            ),
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            Column(
              children: categories
                  .map((e) => GestureDetector(
                        onTap: () {
                          Provider.of<Apicontroller>(context, listen: false)
                              .Search(val: e.name);
                          Navigator.of(context)
                              .pushNamed('Wall', arguments: e.name);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 05),
                          height: 190,
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
            )
          ],
        ),
      ),
    ));
  }
}
