// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_function_declarations_over_variables, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninenty_second_per_word_app/database/drawer_data/drawer_provider.dart';
import 'package:ninenty_second_per_word_app/fronted/components/drawer/drawer_%20link.dart';
import 'package:ninenty_second_per_word_app/fronted/components/drawer/status_info.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/test_page.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_colors.dart';
import 'package:ninenty_second_per_word_app/pages/reset_password_page.dart';
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
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen(),)),
            child: DrawerLink(
              linkName: modelDrawer.linkNames[0],
              icon: modelDrawer.icons[0],
              
            ),
          ),
          //           DrawerLink(
          // linkName: modelDrawer.linkNames[1],
          // icon: modelDrawer.icons[1],
          // func: () {
          //   Navigator.pushNamed(context, '/account_page');
          // }),
          //           DrawerLink(
          // linkName: modelDrawer.linkNames[2],
          // icon: modelDrawer.icons[2],
          // func: () {
          //   Navigator.pushNamed(context, '/account_page');
          // }),
          //           DrawerLink(
          // linkName: modelDrawer.linkNames[3],
          // icon: modelDrawer.icons[3],
          // func: () {
          //   Navigator.pushNamed(context, '/account_page');
          // }),
          //           DrawerLink(
          // linkName: modelDrawer.linkNames[4],
          // icon: modelDrawer.icons[4],
          // func: () {
          //   Navigator.pushNamed(context, '/account_page');
          // })
        ],
      ),
    );
  }
}
