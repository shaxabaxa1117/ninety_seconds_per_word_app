import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';


import 'package:ninenty_second_per_word_app/fronted/style/app_colors.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_style.dart';
import 'package:ninenty_second_per_word_app/provider/drawer_provider.dart';
import 'package:provider/provider.dart';
    int picIndex = 0;
class StatusInfo extends StatelessWidget {

    StatusInfo(
      {super.key,
      required this.name,
      required this.surname,
      
      });
  
  final String name;
  final String surname;



  @override
  Widget build(BuildContext context) {
    var model =  context.watch<DrawerProvider>();
    
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
                model.changeIndex();
                print('Tapped');
                
                },
                child: CircleAvatar(
                  minRadius: 20,
                  child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage(model.imagePath[model.picIndex!]),
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
