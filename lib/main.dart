

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ninenty_second_per_word_app/database/deck_data.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/main_pages/adding_card_page.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/main_pages/edit_note_page.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/main_pages/home_page_acces_users.dart';
import 'package:ninenty_second_per_word_app/provider/deck_provider.dart';
import 'package:ninenty_second_per_word_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

// 
Future<void> main() async {
  


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteDataAdapter());
  await Hive.openBox<NoteData>('notes');
  await Hive.openBox<int>('picIndex');
  Hive.registerAdapter(DeckDataAdapter());
  await Hive.openBox<DeckData>('decks');
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeckProvider(),
      child: MainWidget());
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NotesProvider(),
        child:  ChangeNotifierProvider(
      create: (context) => NotesProvider(),
          child: MaterialApp(
            home: MainPage(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              pageTransitionsTheme: const PageTransitionsTheme(builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                
              }),
            ),
            routes: {
              '/' : (context) =>  MainPage(),
              '/edit_page': (context) =>  const EditNotePage(),
              '/add_card_page': (context) =>  const AddingCardPage(),
              // 
            },
            initialRoute: '/',
          ),
        ));
  }
}
