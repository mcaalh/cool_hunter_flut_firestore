import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SidebarItem {
  SidebarItem({
    required this.icon,
    required this.title,
    required this.goToSettingCategory,
    required this.isCategory,
  });

  final IconData icon;
  final String title;
  VoidCallback goToSettingCategory;
  final IconData chevron = Icons.ac_unit;
  final bool isCategory;
}
