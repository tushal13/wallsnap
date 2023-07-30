import 'package:flutter/material.dart';
import '../modals/Category_model.dart';

final List<CategoryItem> categories = [
  CategoryItem(
      name: 'Nature',
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
  CategoryItem(
      name: 'Abstract',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/03/24/08/56/colorful-3256055_640.jpg'),
  CategoryItem(
      name: 'Animals',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/07/31/22/08/lion-3576045_640.jpg'),
  CategoryItem(
      name: 'Architecture',
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/07/02/16/33/church-2464899_640.jpg'),
  CategoryItem(
      name: 'Technology',
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/05/26/23/52/technology-785742_640.jpg'),
  CategoryItem(
      name: 'Minimalistic',
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/02/27/11/27/utility-pole-6054303_640.png'),
  CategoryItem(
      name: 'Fantasy',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547_640.jpg'),
  CategoryItem(
      name: 'Quotes',
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/05/31/11/10/less-is-more-791109_640.jpg'),
  CategoryItem(
      name: 'Seasons',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/27/22/53/heart-1776746_640.jpg'),
  CategoryItem(
      name: 'Space',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/11/22/23/19/constellations-1851128_640.jpg'),
  CategoryItem(
      name: 'Travel',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/01/09/18/27/camera-1130731_640.jpg'),
  CategoryItem(
      name: 'Food and Drink',
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/04/13/10/48/coffee-5037804_640.jpg'),
  CategoryItem(
      name: 'Art and Illustrations',
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/10/23/20/40/landscape-4572804_1280.jpg'),
  CategoryItem(
      name: 'Patterns',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/02/05/19/51/stained-glass-1181864_1280.jpg'),
  CategoryItem(
      name: 'Sports',
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/01/16/15/28/boxer-1984344_640.jpg'),
  CategoryItem(
      name: 'Cars and Vehicles',
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/09/07/22/34/car-race-438467_640.jpg'),
  CategoryItem(
      name: 'Gaming',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/28/11/57/tic-tac-toe-1777859_640.jpg'),
  CategoryItem(
      name: 'Photography',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/01/09/18/27/camera-1130731_1280.jpg'),
];

class WallsnapPageNotification extends Notification {
  final String category;

  WallsnapPageNotification(this.category);
}
