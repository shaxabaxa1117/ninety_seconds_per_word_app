import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/adding_ward_page.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/drawer_page.dart';

class HomePageAccesUsers extends StatelessWidget {
  const HomePageAccesUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      appBar: AppBar(
        title: const Text(
          '90 seconds',
          style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 59, 59, 59),
      ),
      drawer: DrawerPage(),
      body: AddingPage(),
      
    );
  }
}
