import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/fronted/components/drawer/status_info.dart';

class DrawerProvider extends ChangeNotifier {
  int picIndex = 0;
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
      
    
  void changeIndex()  async{
    if(picIndex != imagePath.length){
      picIndex +=1;
    
    }else if(picIndex == imagePath){
      picIndex = 0;

    }

    await HiveBox.picIndex.add(picIndex);
    picIndex = HiveBox.picIndex.values.toList().last;
  } 
  }


