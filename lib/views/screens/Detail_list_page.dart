import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../controllers/api_controller.dart';
import '../components/tile.dart';

class Detail_List extends StatelessWidget {
  const Detail_List({super.key});

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.grey,
            ),
          ),
          title: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey),
          ),
        ),
        body: Consumer<Apicontroller>(
          builder: (context, pro, _) {
            List data = pro.data;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Expanded(
                      child: MasonryGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('WallSnap',
                                  arguments: data[index]);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Tile(
                                imageUrl: data[index]['largeImageURL'],
                                index: index,
                                height: (index % 7) * 100,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
