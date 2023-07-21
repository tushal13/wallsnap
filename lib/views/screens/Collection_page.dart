import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallsnap/controllers/api_controller.dart';
import 'package:wallsnap/utility/category_list.dart';

class Collectione_Page extends StatelessWidget {
  const Collectione_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final e = categories[index];
                return GestureDetector(
                  onTap: () {
                    Provider.of<Apicontroller>(context, listen: false)
                        .Search(val: e.name);
                    Navigator.of(context).pushNamed('Wall', arguments: e.name);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
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
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
