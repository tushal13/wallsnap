import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:provider/provider.dart';
import 'package:wallsnap/controllers/Connectivity_controller.dart';
import 'package:wallsnap/controllers/Wallpaper_controller.dart';
import 'package:wallsnap/views/screens/no_internet.dart';

class WallSnap extends StatelessWidget {
  const WallSnap({super.key});
  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments as dynamic;

    return Scaffold(
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
                : (data == null || data.isEmpty)
                    ? Center(
                        child: Image.asset('assets/images/video-unscreen.gif'),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                Navigator.of(context).pop();
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Select the display option'),
                                                      content: Consumer<
                                                          WallController>(
                                                        builder:
                                                            (context, wall, _) {
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              RadioListTile(
                                                                title: Text(
                                                                    'Lock Screen'),
                                                                value: 1,
                                                                groupValue: wall
                                                                    .selectedRadioValue,
                                                                onChanged:
                                                                    (value) {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  wall.setSelectedRadioValue(
                                                                      value!);
                                                                  AsyncWallpaper
                                                                      .setWallpaper(
                                                                    url: data[
                                                                        'largeImageURL'],
                                                                    goToHome:
                                                                        true,
                                                                    wallpaperLocation:
                                                                        AsyncWallpaper
                                                                            .LOCK_SCREEN,
                                                                    toastDetails:
                                                                        ToastDetails
                                                                            .success(),
                                                                    errorToastDetails:
                                                                        ToastDetails
                                                                            .error(),
                                                                  );
                                                                },
                                                              ),
                                                              RadioListTile(
                                                                title: Text(
                                                                    'Home Screen'),
                                                                value: 2,
                                                                groupValue: wall
                                                                    .selectedRadioValue,
                                                                onChanged:
                                                                    (value) {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  wall.setSelectedRadioValue(
                                                                      value!);
                                                                  AsyncWallpaper
                                                                      .setWallpaper(
                                                                    url: data[
                                                                        'largeImageURL'],
                                                                    goToHome:
                                                                        true,
                                                                    wallpaperLocation:
                                                                        AsyncWallpaper
                                                                            .HOME_SCREEN,
                                                                    toastDetails:
                                                                        ToastDetails
                                                                            .success(),
                                                                    errorToastDetails:
                                                                        ToastDetails
                                                                            .error(),
                                                                  );
                                                                },
                                                              ),
                                                              RadioListTile(
                                                                title: Text(
                                                                    'Both'),
                                                                value: 3,
                                                                groupValue: wall
                                                                    .selectedRadioValue,
                                                                onChanged:
                                                                    (value) {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  wall.setSelectedRadioValue(
                                                                      value!);
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
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
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
                                                      color:
                                                          Colors.grey.shade300,
                                                      height: 380,
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 60,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
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
                                                                          color:
                                                                              Colors.black87,
                                                                          fontFamily:
                                                                              'Medium',
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          fontSize:
                                                                              13,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                            showDialog(
                                                                              context: context,
                                                                              builder: (BuildContext context) {
                                                                                return AlertDialog(
                                                                                  title: Text('Select the display option'),
                                                                                  content: Consumer<WallController>(
                                                                                    builder: (context, wall, _) {
                                                                                      return Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          RadioListTile(
                                                                                            title: Text('Lock Screen'),
                                                                                            value: 1,
                                                                                            groupValue: wall.selectedRadioValue,
                                                                                            onChanged: (value) {
                                                                                              Navigator.of(context).pop();
                                                                                              wall.setSelectedRadioValue(value!);
                                                                                              AsyncWallpaper.setWallpaper(
                                                                                                url: data['largeImageURL'],
                                                                                                goToHome: true,
                                                                                                wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
                                                                                                toastDetails: ToastDetails.success(),
                                                                                                errorToastDetails: ToastDetails.error(),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                          RadioListTile(
                                                                                            title: Text('Home Screen'),
                                                                                            value: 2,
                                                                                            groupValue: wall.selectedRadioValue,
                                                                                            onChanged: (value) {
                                                                                              Navigator.of(context).pop();
                                                                                              wall.setSelectedRadioValue(value!);
                                                                                              AsyncWallpaper.setWallpaper(
                                                                                                url: data['largeImageURL'],
                                                                                                goToHome: true,
                                                                                                wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                                                                                                toastDetails: ToastDetails.success(),
                                                                                                errorToastDetails: ToastDetails.error(),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                          RadioListTile(
                                                                                            title: Text('Both'),
                                                                                            value: 3,
                                                                                            groupValue: wall.selectedRadioValue,
                                                                                            onChanged: (value) {
                                                                                              Navigator.of(context).pop();
                                                                                              wall.setSelectedRadioValue(value!);
                                                                                              AsyncWallpaper.setWallpaper(
                                                                                                url: data['largeImageURL'],
                                                                                                goToHome: true,
                                                                                                wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                                                                                                toastDetails: ToastDetails.success(),
                                                                                                errorToastDetails: ToastDetails.error(),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                          icon:
                                                                              Icon(Icons.settings_system_daydream_rounded)),
                                                                      //butome sheet with wallpaper ditailes
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          icon:
                                                                              Icon(Icons.keyboard_double_arrow_down_outlined)),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  width: 190,
                                                                  height: 38,
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(Icons
                                                                          .remove_red_eye),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "${data['views']}"
                                                                            .toUpperCase(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black87,
                                                                          fontFamily:
                                                                              'Medium',
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          fontSize:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  width: 190,
                                                                  height: 38,
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(CupertinoIcons
                                                                          .arrow_down_right_arrow_up_left),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "${data['imageHeight']} X ${data['imageWidth']}"
                                                                            .toUpperCase(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black87,
                                                                          fontFamily:
                                                                              'Medium',
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          fontSize:
                                                                              16,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  width: 190,
                                                                  height: 38,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Icon(Icons
                                                                          .file_open),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        "image/${data['type']}"
                                                                            .toUpperCase(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black87,
                                                                          fontFamily:
                                                                              'Medium',
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          fontSize:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "Preview's"
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
                                                                    fontSize:
                                                                        13,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.of(context).pushNamed(
                                                                        'LockScreenPreview',
                                                                        arguments:
                                                                            data);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                10),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    width: 190,
                                                                    height: 38,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Icon(Icons
                                                                            .file_open),
                                                                        SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                          "LockScreen"
                                                                              .toUpperCase(),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black87,
                                                                            fontFamily:
                                                                                'Medium',
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            fontSize:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.of(context).pushNamed(
                                                                        'HomeScreenPreview',
                                                                        arguments:
                                                                            data);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                10),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    width: 190,
                                                                    height: 38,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Icon(Icons
                                                                            .file_open),
                                                                        SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                          "HomeScreen"
                                                                              .toUpperCase(),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black87,
                                                                            fontFamily:
                                                                                'Medium',
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            fontSize:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              9),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  width: 390,
                                                                  height: 82,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        'assets/images/img.png',
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            12,
                                                                      ),
                                                                      Container(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  "Wallsnap".toUpperCase(),
                                                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                                                ),
                                                                                Text(
                                                                                  "This Wallpaper is a property of wallsnap. you can use it for\nyour Personal ue only. any distribution or sharing is not\n allowed without the permisssion of the owner ".toUpperCase(),
                                                                                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700),
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
              : (data == null || data.isEmpty)
                  ? Center(
                      child: Image.asset('assets/images/video-unscreen.gif'),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Select the display option'),
                                                    content: Consumer<
                                                        WallController>(
                                                      builder:
                                                          (context, wall, _) {
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            RadioListTile(
                                                              title: Text(
                                                                  'Lock Screen'),
                                                              value: 1,
                                                              groupValue: wall
                                                                  .selectedRadioValue,
                                                              onChanged:
                                                                  (value) {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                wall.setSelectedRadioValue(
                                                                    value!);
                                                                AsyncWallpaper
                                                                    .setWallpaper(
                                                                  url: data[
                                                                      'largeImageURL'],
                                                                  goToHome:
                                                                      true,
                                                                  wallpaperLocation:
                                                                      AsyncWallpaper
                                                                          .LOCK_SCREEN,
                                                                  toastDetails:
                                                                      ToastDetails
                                                                          .success(),
                                                                  errorToastDetails:
                                                                      ToastDetails
                                                                          .error(),
                                                                );
                                                              },
                                                            ),
                                                            RadioListTile(
                                                              title: Text(
                                                                  'Home Screen'),
                                                              value: 2,
                                                              groupValue: wall
                                                                  .selectedRadioValue,
                                                              onChanged:
                                                                  (value) {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                wall.setSelectedRadioValue(
                                                                    value!);
                                                                AsyncWallpaper
                                                                    .setWallpaper(
                                                                  url: data[
                                                                      'largeImageURL'],
                                                                  goToHome:
                                                                      true,
                                                                  wallpaperLocation:
                                                                      AsyncWallpaper
                                                                          .HOME_SCREEN,
                                                                  toastDetails:
                                                                      ToastDetails
                                                                          .success(),
                                                                  errorToastDetails:
                                                                      ToastDetails
                                                                          .error(),
                                                                );
                                                              },
                                                            ),
                                                            RadioListTile(
                                                              title:
                                                                  Text('Both'),
                                                              value: 3,
                                                              groupValue: wall
                                                                  .selectedRadioValue,
                                                              onChanged:
                                                                  (value) {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                wall.setSelectedRadioValue(
                                                                    value!);
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
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
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
                                                  height: 380,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 60,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
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
                                                                      fontSize:
                                                                          13,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (BuildContext context) {
                                                                            return AlertDialog(
                                                                              title: Text('Select the display option'),
                                                                              content: Consumer<WallController>(
                                                                                builder: (context, wall, _) {
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: [
                                                                                      RadioListTile(
                                                                                        title: Text('Lock Screen'),
                                                                                        value: 1,
                                                                                        groupValue: wall.selectedRadioValue,
                                                                                        onChanged: (value) {
                                                                                          Navigator.of(context).pop();
                                                                                          wall.setSelectedRadioValue(value!);
                                                                                          AsyncWallpaper.setWallpaper(
                                                                                            url: data['largeImageURL'],
                                                                                            goToHome: true,
                                                                                            wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
                                                                                            toastDetails: ToastDetails.success(),
                                                                                            errorToastDetails: ToastDetails.error(),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                      RadioListTile(
                                                                                        title: Text('Home Screen'),
                                                                                        value: 2,
                                                                                        groupValue: wall.selectedRadioValue,
                                                                                        onChanged: (value) {
                                                                                          Navigator.of(context).pop();
                                                                                          wall.setSelectedRadioValue(value!);
                                                                                          AsyncWallpaper.setWallpaper(
                                                                                            url: data['largeImageURL'],
                                                                                            goToHome: true,
                                                                                            wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                                                                                            toastDetails: ToastDetails.success(),
                                                                                            errorToastDetails: ToastDetails.error(),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                      RadioListTile(
                                                                                        title: Text('Both'),
                                                                                        value: 3,
                                                                                        groupValue: wall.selectedRadioValue,
                                                                                        onChanged: (value) {
                                                                                          Navigator.of(context).pop();
                                                                                          wall.setSelectedRadioValue(value!);
                                                                                          AsyncWallpaper.setWallpaper(
                                                                                            url: data['largeImageURL'],
                                                                                            goToHome: true,
                                                                                            wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                                                                                            toastDetails: ToastDetails.success(),
                                                                                            errorToastDetails: ToastDetails.error(),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      icon: Icon(
                                                                          Icons
                                                                              .settings_system_daydream_rounded)),
                                                                  IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      icon: Icon(
                                                                          Icons
                                                                              .keyboard_double_arrow_down_outlined)),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
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
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black87,
                                                                      fontFamily:
                                                                          'Medium',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
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
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black87,
                                                                      fontFamily:
                                                                          'Medium',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              width: 190,
                                                              height: 38,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Icon(Icons
                                                                      .file_open),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    "image/${data['type']}"
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
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "Preview's"
                                                                  .toUpperCase(),
                                                              style: TextStyle(
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
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pushNamed(
                                                                        'LockScreenPreview',
                                                                        arguments:
                                                                            data);
                                                              },
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                width: 190,
                                                                height: 38,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Icon(Icons
                                                                        .file_open),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      "LockScreen"
                                                                          .toUpperCase(),
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black87,
                                                                        fontFamily:
                                                                            'Medium',
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pushNamed(
                                                                        'HomeScreenPreview',
                                                                        arguments:
                                                                            data);
                                                              },
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                width: 190,
                                                                height: 38,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Icon(Icons
                                                                        .file_open),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      "HomeScreen"
                                                                          .toUpperCase(),
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black87,
                                                                        fontFamily:
                                                                            'Medium',
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(9),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              width: 390,
                                                              height: 82,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
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
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Wallsnap".toUpperCase(),
                                                                              style: TextStyle(fontWeight: FontWeight.bold),
                                                                            ),
                                                                            Text(
                                                                              "This Wallpaper is a property of wallsnap. you can use it for\nyour Personal ue only. any distribution or sharing is not\n allowed without the permisssion of the owner ".toUpperCase(),
                                                                              style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700),
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
                                              .keyboard_double_arrow_up_outlined),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        )
                      ],
                    );
        },
      );
    }));
  }
}
