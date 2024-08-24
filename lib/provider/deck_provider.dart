import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/database/deck_data.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';

class DeckProvider extends ChangeNotifier {
  final deckNameController = TextEditingController();
  int? deckIndex;
  


  Future<void> addDeck(BuildContext context) async {
    await HiveBox.decks.add(
      DeckData(name: deckNameController.text.isNotEmpty ? deckNameController.text : 'No name', notes: [],isFull: false)
    ).then((value) => Navigator.pop(context)).then((value) => controllersClear());
  }

  void controllersClear() {
    deckNameController.clear();
  }

  void deleteDeck(int index) async {
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
      var deck = box.getAt(deckIndex!);
      deck?.notes?.add(notesNew.last);
        
        if(deck != null && deck.notes!.length < 4){
        await box.putAt(deck.deckIndex ?? 0, deck);
        }else{
          deck?.isFull = true;
          print('Уже полон');
        }
        print('AddNoteToDeck');
        
        notifyListeners();
      
  }
  }

  

  getIndex({required int index}){
    deckIndex = index;
  }
}