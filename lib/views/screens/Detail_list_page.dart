import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:wallsnap/controllers/Connectivity_controller.dart';
import 'package:wallsnap/views/screens/no_internet.dart';

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
        body: Consumer<ConnectivityController>(builder: (context, pro, _) {
          return StreamBuilder(
            stream: pro.isconnected.onConnectivityChanged,
            builder: (context, snapshot) {
              if (snapshot.data == ConnectivityResult.mobile) {
                Future.delayed(Duration(seconds: 5), () {
                  pro.isConnectivity();
                  print('mobile${pro.isConnectivity().toString()}');
                });
              } else if (snapshot.data == ConnectivityResult.wifi) {
                Future.delayed(Duration(seconds: 5), () {
                  pro.isConnectivity();
                  print('wifi-${pro.isConnectivity().toString()}');
                });
                return !pro.hasInternetConnection
                    ? Center(
                        child: Image.asset(
                          'assets/images/video-unscreen.gif',
                          color: Colors.purple,
                          height: 100,
                        ),
                      )
                    : Consumer<Apicontroller>(
                        builder: (context, pro, _) {
                          List data = pro.data;
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
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          'WallSnap',
                                                          arguments:
                                                              data[index]);
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Tile(
                                                    imageUrl: data[index]
                                                        ['largeImageURL'],
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
                        },
                      );
              } else if (snapshot.data == ConnectivityResult.none) {
                Future.delayed(Duration(seconds: 5), () {
                  pro.noConnectivity();
                  print('none-${pro.noConnectivity().toString()}');
                });
                return Center(
                  // on connectivitybreck
                  child: pro.hasInternetConnection
                      ? Center(
                          child: Image.asset(
                            'assets/images/video-unscreen.gif',
                            color: Colors.purple,
                            width: 150,
                          ),
                        )
                      : NOINTERNET(),
                );
              }
              return !pro.hasInternetConnection
                  ? Center(
                      child: Image.asset(
                        'assets/images/video-unscreen.gif',
                        color: Colors.purple,
                        height: 100,
                      ),
                    )
                  : Consumer<Apicontroller>(
                      builder: (context, pro, _) {
                        List data = pro.data;
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
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Tile(
                                                  imageUrl: data[index]
                                                      ['largeImageURL'],
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
                      },
                    );
            },
          );
        }));
  }
}
