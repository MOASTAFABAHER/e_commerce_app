import 'package:e_commerce_app/views/payment/toggle_screen.dart';
import 'package:flutter/material.dart';

class SettingsData {
  String? name;
  var icon;
  bool? isLast;
  Widget? widget;
  SettingsData(
      {required this.icon,
      required this.name,
      this.isLast = false,
      this.widget}) {}
}

List<SettingsData> myData = [
  SettingsData(
    icon: Icons.shopping_cart_outlined,
    name: 'Cart',
  ),
  SettingsData(
    icon: Icons.favorite,
    name: 'Wish List',
  ),
  SettingsData(
    icon: Icons.card_travel,
    name: 'My Orders',
  ),
  SettingsData(
    icon: Icons.local_phone_outlined,
    name: 'Contact us',
  ),
  SettingsData(
    icon: Icons.sd_card_alert_outlined,
    name: 'About us',
  ),
  SettingsData(
    icon: Icons.calendar_view_month_rounded,
    name: 'Categoreis',
  ),
  SettingsData(
    isLast: true,
    icon: Icons.logout,
    name: 'Log out',
  ),
];
