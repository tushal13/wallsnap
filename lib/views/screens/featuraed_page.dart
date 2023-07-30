import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../controllers/api_controller.dart';
import '../components/tile.dart';

class Featured_WallSnap_Page extends StatelessWidget {
  const Featured_WallSnap_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<Apicontroller>(context, listen: false).Featuredwallsnap(
          val: 'words',
          order: 'latest',
        ),
        child: Consumer<Apicontroller>(builder: (context, pro, _) {
          List data = pro.FeaturedWallSnap;
          return data.isNotEmpty
              ? Center(
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
                                    height: (index % 4) * 100,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                child: Column(
                  children: [
                    Image.asset(
                        'assets/images/video-unscreen.gif'),
                  ],
                ),
              );
        }),
      ),
    );
  }
}
