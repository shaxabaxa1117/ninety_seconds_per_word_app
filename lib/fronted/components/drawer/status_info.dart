import 'package:flutter/material.dart';

import 'package:ninenty_second_per_word_app/database/drawer_data/drawer_provider.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_colors.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_style.dart';
import 'package:provider/provider.dart';

class StatusInfo extends StatelessWidget {

  const StatusInfo(
      {super.key,
      required this.name,
      required this.surname,
      
      });
  
  final String name;
  final String surname;


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
                drawerModel.randomChangeAvatar();
                
                
                },
                child: CircleAvatar(
                  minRadius: 20,
                  child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage(drawerModel.selectedAvatar),
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
                    name,
                    style: AppStyle.fontStyle,
                  ),
                  
                  Text(
                    surname,
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
