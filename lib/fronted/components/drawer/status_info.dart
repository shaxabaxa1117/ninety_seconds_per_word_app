import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';

import 'package:ninenty_second_per_word_app/provider/drawer_provider.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_colors.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_style.dart';
import 'package:provider/provider.dart';
    int picIndex = 0;
class StatusInfo extends StatefulWidget {

    StatusInfo(
      {super.key,
      required this.name,
      required this.surname,
      
      });
  
  final String name;
  final String surname;

  @override
  State<StatusInfo> createState() => _StatusInfoState();
}



class _StatusInfoState extends State<StatusInfo> {
  final List<String> imagePath = [
    'assets/images/avatars/jaguar_avatar.png',
    'assets/images/avatars/dog_avatar.png',
    'assets/images/avatars/man_avatar.png',
    'assets/images/avatars/woman_avatar.png',
    'assets/images/avatars/deer_avatar.png',
    'assets/images/avatars/turtle_avatar.png'
  ];


  void _incrementItem() {
    setState(() {
      if(picIndex == 5){
        picIndex = 0;
      }else{
        picIndex++;
      }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    var drawerModel = context.watch<DrawerModel>();
    
    return Container(
      color: AppColors.backgroundColor,
      height: 200,
      width: double.infinity,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8 ),
              child: GestureDetector(
                onTap: () {
                  _incrementItem();
                print('Tapped');
                
                },
                child: CircleAvatar(
                  minRadius: 20,
                  child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage(imagePath[picIndex]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  SizedBox(height: 70,),
                  Text(
                    widget.name,
                    style: AppStyle.fontStyle,
                  ),
                  
                  Text(
                    widget.surname,
                    style: AppStyle.fontStyle,
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
