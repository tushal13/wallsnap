import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final int index;
  final String imageUrl;
  final double height;

  const Tile(
      {required this.index, required this.imageUrl, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/images/loading.gif',
        placeholderCacheHeight: 10,
        placeholderFit: BoxFit.cover,
        image: imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
