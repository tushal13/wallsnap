import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../../controllers/api_controller.dart';
import '../components/tile.dart';

class Popular_WallSnap_Page extends StatelessWidget {
  const Popular_WallSnap_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<Apicontroller>(context, listen: false).Popularwallsnap(
          val: 'popular',
          order: 'latest',
        ),
        child: Consumer<Apicontroller>(builder: (context, pro, _) {
          List data = pro.PopularWallSnap;
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
                )
              : Center(
                  child: Image.asset(
                    'assets/images/video-unscreen.gif',
                    color: Colors.purple,
                    width: 150,
                  ),
                );
        }),
      ),
    );
  }
}
