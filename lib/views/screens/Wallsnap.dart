import 'package:flutter/cupertino.dart';
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
                      color: Colors.white,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${data['tags']}".toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Medium',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
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
                                IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            color: Colors.grey.shade300,
                                            height: 280,
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: 60,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "${data['tags']}"
                                                                    .toUpperCase(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black87,
                                                                  fontFamily:
                                                                      'Medium',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 13,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(context).pushNamed(
                                                                        'WallSnapPreview',
                                                                        arguments:
                                                                            data);
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .preview)),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    AsyncWallpaper
                                                                        .setWallpaper(
                                                                      url: data[
                                                                          'largeImageURL'],
                                                                      goToHome:
                                                                          true,
                                                                      wallpaperLocation:
                                                                          AsyncWallpaper
                                                                              .BOTH_SCREENS,
                                                                      toastDetails:
                                                                          ToastDetails
                                                                              .success(),
                                                                      errorToastDetails:
                                                                          ToastDetails
                                                                              .error(),
                                                                    );
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .settings_system_daydream_rounded)),
                                                              //butome sheet with wallpaper ditailes
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .keyboard_double_arrow_down_outlined)),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        width: 190,
                                                        height: 38,
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons
                                                                .remove_red_eye),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              "${data['views']}"
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontFamily:
                                                                    'Medium',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        width: 190,
                                                        height: 38,
                                                        child: Row(
                                                          children: [
                                                            Icon(CupertinoIcons
                                                                .arrow_down_right_arrow_up_left),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              "${data['imageHeight']} X ${data['imageWidth']}"
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontFamily:
                                                                    'Medium',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        width: 190,
                                                        height: 38,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(Icons
                                                                .file_open),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "image/${data['type']}"
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontFamily:
                                                                    'Medium',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(9),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        width: 390,
                                                        height: 82,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Image.asset(
                                                              'assets/images/img.png',
                                                            ),
                                                            SizedBox(
                                                              width: 12,
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Wallsnap"
                                                                            .toUpperCase(),
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      Text(
                                                                        "This Wallpaper is a property of wallsnap. you can use it for\nyour Personal ue only. any distribution or sharing is not\n allowed without the permisssion of the owner "
                                                                            .toUpperCase(),
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                9,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons
                                        .keyboard_double_arrow_up_outlined)),
                              ],
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
    );
  }
}
