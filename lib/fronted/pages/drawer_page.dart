// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninenty_second_per_word_app/database/drawer_data/drawer_provider.dart';
import 'package:ninenty_second_per_word_app/fronted/components/drawer/drawer_%20link.dart';
import 'package:ninenty_second_per_word_app/fronted/components/drawer/status_info.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_colors.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DrawerModel(),
      child: DrawerWidget(),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final modelDrawer = context.watch<DrawerModel>();

    return Drawer(
      backgroundColor: AppColors.backgroundColor,
      child: Column(
        children: [
          StatusInfo(
            name: 'Shakhzod',
            surname: 'Abdurasulov',
          ),
          
          Container(
            color: AppColors.dividerColor,
            height: 2.5,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => DrawerLink(
                    linkName: modelDrawer.linkNames[index],
                    icon: modelDrawer.icons[index]),
                separatorBuilder: (context, index) => Divider(
                      thickness: 2.5,
                      color: AppColors.dividerColor,
                    ),
                itemCount: modelDrawer.linkNames.length),
          )
        ],
      ),
    );
  }
}
