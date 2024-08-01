import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/database/deck_data.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';

class DeckProvider extends ChangeNotifier {
  final deckNameController = TextEditingController();
  int deckIndex = 0;

  Future<void> addDeck(BuildContext context) async {
    await HiveBox.decks.add(
      DeckData(name: deckNameController.text.isNotEmpty ? deckNameController.text : 'No name')
    ).then((value) => Navigator.pop(context)).then((value) => controllersClear());
  }

  void controllersClear() {
    deckNameController.clear();
  }

  void deleteNote(int index) async {
    await HiveBox.decks.deleteAt(index);
  }

  void onChange(BuildContext context, int index) async {
    await HiveBox.decks.putAt(index, DeckData(name: deckNameController.text))
      .then((value) => Navigator.pop(context))
      .then((value) => controllersClear());
    print('работает onChange');
  }




  Future<void> addNoteToDeck(BuildContext context,) async {
    final notesNew = HiveBox.notes.values.toList();
    if (notesNew.isNotEmpty) {

      var box = HiveBox.decks;
      var deck = box.getAt(deckIndex);
      
      if (deck != null) {
        deck.notes?.add(notesNew.last);
        
        
        await box.putAt(deckIndex, deck).then((value) => Navigator.pop(context));
        
        notifyListeners();
      } else {
        print('Колода с таким индексом не найдена.');
      }
    } else {
      print('Список заметок пуст.');
    }
  }

  void saveIndex(int index) {
    deckIndex = index;
  }
}