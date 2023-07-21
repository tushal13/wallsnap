import 'package:flutter/material.dart';
import 'package:async_wallpaper/async_wallpaper.dart';

class WallSnap extends StatelessWidget {
  const WallSnap({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments as dynamic;

    return Scaffold(
      body: (data == null || data.isEmpty)
          ? Center(
              child: Image.asset(
                  'assets/images/loding-dots-8467284-6720621-unscreen.gif'),
            )
          : Stack(
              children: [
                Image.network(
                  data['largeImageURL'],
                  fit: BoxFit.fill,
                  height: double.infinity,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 60,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "${data['tags']}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          'WallSnapPreview',
                                          arguments: data);
                                    },
                                    icon: Icon(Icons.preview)),
                                IconButton(
                                    onPressed: () {
                                      AsyncWallpaper.setWallpaper(
                                        url: data['largeImageURL'],
                                        goToHome: true,
                                        wallpaperLocation:
                                            AsyncWallpaper.BOTH_SCREENS,
                                        toastDetails: ToastDetails.success(),
                                        errorToastDetails: ToastDetails.error(),
                                      );
                                    },
                                    icon: Icon(Icons
                                        .settings_system_daydream_rounded)),
                                //butome sheet with wallpaper ditailes
                                // IconButton(
                                //     onPressed: () {},
                                //     icon: Icon(Icons.keyboard_double_arrow_up)),
                              ],
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
    );
  }
}
