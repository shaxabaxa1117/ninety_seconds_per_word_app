import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';

class DrawerModel extends ChangeNotifier {

  final List linkNames = [
    'Settings',
    'Info',
    'Help',
    'Feedback',
    'Support us',
  ];
  final List<IconData> icons = [
    Icons.settings,
    Icons.info,
    Icons.help,
    Icons.rate_review,
    Icons.monetization_on_outlined
  ];
}
