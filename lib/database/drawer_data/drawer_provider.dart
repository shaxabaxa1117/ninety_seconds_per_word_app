import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  final List<String> imagePath = [
    'assets/images/avatars/jaguar_avatar.png',
    'assets/images/avatars/dog_avatar.png',
    'assets/images/avatars/man_avatar.png',
    'assets/images/avatars/woman_avatar.png',
    'assets/images/avatars/deer_avatar.png',
    'assets/images/avatars/turtle_avatar.png'
  ];

    int index = 0;

  String selectedAvatar = 'assets/images/avatars/jaguar_avatar.png';
  randomChangeAvatar() {
  
    if (index == imagePath.length - 1) {
      index = 0;
      
      
    } else {
      index++;
      
    }
    
    selectedAvatar = imagePath[index];
    notifyListeners();
  }
}
