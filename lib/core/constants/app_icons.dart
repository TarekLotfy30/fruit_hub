import 'package:flutter/material.dart';

abstract final class AppIcons {
  // If using Flutter built-in icons
  static const IconData cart = Icons.shopping_cart;
  static const IconData search = Icons.search;
  static const IconData home = Icons.home;
  static const IconData favorite = Icons.favorite;
  static const IconData profile = Icons.person;

  // If using custom SVG or PNG icons
  static const String fruit = 'assets/icons/fruit.svg';
  static const String basket = 'assets/icons/basket.png';
}
