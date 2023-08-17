import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../../controllers/api_controller.dart';
import '../components/tile.dart';

class WallSnap_Page extends StatelessWidget {
  WallSnap_Page({super.key});
  Connectivity isconnected = Connectivity();
  bool hasInternetConnection = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: isconnected.onConnectivityChanged,
          builder: (context, snapshot) {
            return RefreshIndicator(
              onRefresh: () =>
                  Provider.of<Apicontroller>(context, listen: false)
                      .wallsnap(val: 'hindu god'),
              child: Consumer<Apicontroller>(builder: (context, pro, _) {
                List data = pro.WallSnap;
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
                                        Navigator.of(context).pushNamed(
                                            'WallSnap',
                                            arguments: data[index]);
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Tile(
                                          imageUrl: data[index]
                                              ['largeImageURL'],
                                          index: index,
                                          height: (index % 5) * 100,
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
                    :Center(
                  child: Image.asset(
                    'assets/images/video-unscreen.gif',
                    color: Colors.purple,
                    width: 150,
                  ),
                );
              }),
            );
          }),
    );
  }
}
