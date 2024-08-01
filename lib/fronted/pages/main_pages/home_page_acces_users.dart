import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/AI_chat/ai_chat_screen.dart';

import 'package:ninenty_second_per_word_app/fronted/pages/main_pages/adding_card_page.dart';

import 'package:ninenty_second_per_word_app/fronted/pages/drawer/drawer_page.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/main_pages/favourite_words_page.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/main_pages/home_page.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/main_pages/deck_list_page.dart';
import 'package:ninenty_second_per_word_app/provider/deck_provider.dart';
import 'package:ninenty_second_per_word_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    DeckListPage(),
    FavouriteWordsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return ChangeNotifierProvider(
      create: (context) => DeckProvider(),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          onPressed: () {
            model.controllersClear();
      
            Navigator.pushNamed(context, '/add_card_page');
          },
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
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
            
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: const Color.fromARGB(112, 255, 255, 255),
            ),
      
            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.list_alt),
              title: Text("List of decks"),
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
