import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/AI_chat/ai_chat_screen.dart';

import 'package:ninenty_second_per_word_app/fronted/pages/main_pages/adding_card_page.dart';

import 'package:ninenty_second_per_word_app/fronted/pages/drawer/drawer_page.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/main_pages/favourite_words_page.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/main_pages/home_page.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/main_pages/word_list_page.dart';
import 'package:ninenty_second_per_word_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePageAccesUsers extends StatefulWidget {
  

  @override
  _HomePageAccesUsersState createState() => _HomePageAccesUsersState();
}

class _HomePageAccesUsersState extends State<HomePageAccesUsers> {
  var _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    AddingCardPage(),
    WordListPage(),
    FavouriteWordsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AIChatScreen()),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.forum),
              Text('AI chat',style: TextStyle(fontSize: 8),)
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text(
            '90 seconds',
            style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 59, 59, 59),
        ),
        drawer: DrawerPage(),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: const Color.fromARGB(112, 255, 255, 255),
            ),
      
            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.add),
              title: Text("Add card"),
              selectedColor: const Color.fromARGB(112, 255, 255, 255),
            ),
      
            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.list_alt),
              title: Text("List of words"),
              selectedColor: const Color.fromARGB(112, 255, 255, 255),
            ),
      
            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Favourite cards"),
              selectedColor: const Color.fromARGB(112, 255, 255, 255),
            ),
          ],
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}
