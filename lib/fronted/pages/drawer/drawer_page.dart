// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_function_declarations_over_variables, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninenty_second_per_word_app/provider/drawer_provider.dart';
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
            surname: 'Bakhodirov',
          ),
          Container(
            color: AppColors.dividerColor,
            height: 2.5,
          ),
          SizedBox(
            height: 7,
          ),
          GestureDetector(
            
            child: DrawerLink(
              linkName: modelDrawer.linkNames[0],
              icon: modelDrawer.icons[0],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          DrawerLink(
            linkName: modelDrawer.linkNames[1],
            icon: modelDrawer.icons[1],
          ),
          SizedBox(
            height: 7,
          ),
          DrawerLink(
            linkName: modelDrawer.linkNames[2],
            icon: modelDrawer.icons[2],
          ),
          SizedBox(
            height: 7,
          ),
          DrawerLink(
            linkName: modelDrawer.linkNames[3],
            icon: modelDrawer.icons[3],
          ),
          SizedBox(
            height: 7,
          ),
          DrawerLink(
            linkName: modelDrawer.linkNames[4],
            icon: modelDrawer.icons[4],
          )
        ],
      ),
    );
  }
}
