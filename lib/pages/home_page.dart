import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_colors.dart';
import 'package:ninenty_second_per_word_app/pages/accaunt_page.dart';
import 'package:ninenty_second_per_word_app/pages/login_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   backgroundColor: AppColors.headerColor,
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         if ((user == null)) {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => const LoginScreen()),
      //           );
      //         } else {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => const AccountScreen()),
      //           );
      //         }
      //       },
      //       icon: Icon(
      //         Icons.person,
      //         color: (user == null) ? Colors.black : Colors.yellow,
      //       ),
      //     ),
      //   ],
      // ),
      body: (user == null)
          ? const LoginScreen()
          : const Text('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
      // bottomNavigationBar: (user == null) ? Text('data') : Text(''),
    );
  }
}
