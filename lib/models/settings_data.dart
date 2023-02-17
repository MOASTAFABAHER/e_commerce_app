import 'package:e_commerce_app/views/payment/toggle_screen.dart';
import 'package:e_commerce_app/views/settings/List_of_categories_screen.dart';
import 'package:e_commerce_app/views/settings/about_us_screen.dart';
import 'package:e_commerce_app/views/settings/contact_us_screenn.dart';
import 'package:e_commerce_app/views/settings/test_screen.dart';
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
      widget: const TestScreen()),
  SettingsData(
    icon: Icons.favorite,
    name: 'Wish List',
  ),
  SettingsData(
      icon: Icons.card_travel, name: 'My Orders', widget: const TestScreen()),
  SettingsData(
      icon: Icons.local_phone_outlined,
      name: 'Contact us',
      widget: const ContactUsScreen()),
  SettingsData(
      icon: Icons.sd_card_alert_outlined,
      name: 'About us',
      widget: AboutUsScreen()),
  SettingsData(
      icon: Icons.calendar_view_month_rounded,
      name: 'Categoreis',
      widget: const ListOfCategoriesScreen()),
  SettingsData(
      isLast: true,
      icon: Icons.logout,
      name: 'Log out',
      widget: const TestScreen()),
];
