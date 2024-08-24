import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/database/deck_data.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';

class NotesProvider extends ChangeNotifier {
  // controllers
  int noteToDeckIndex = 0;
  final wordController = TextEditingController();
  final sentenceController = TextEditingController();
  int editingIndex = 0;

  // add notes

//! View
  Future<void> addNote(context) async {
    await HiveBox.notes
        .add(NoteData(
          word: wordController.text.isNotEmpty ? wordController.text: 'No word is mentioned',
          sentence: sentenceController.text.isNotEmpty? sentenceController.text: 'No sentence is given',))
        .then((value) => controllersClear());
        print('работает addNote');
  }

  // очищение контрллера
  controllersClear() {
    wordController.clear();
    sentenceController.clear();
  }

//* Deleting

void deleteNoteInDeck({required int deckIndex, required int noteIndex}) async {
  var decksBox = HiveBox.decks;
  var deck = decksBox.values.toList();
  deck[deckIndex].notes!.removeAt(noteIndex);
  
    await decksBox.putAt(deckIndex, deck[deckIndex]);
  
}

  //* c note 
  // Future<void> onCheck(int index, List<NoteData> allNotes) async{
  // await HiveBox.notes.putAt(index,
  // NoteData(
  // word: allNotes[index].title,//! changing the data entirly
  // sentence: allNotes[index].text,
  // isFavourite: !allNotes[index].isFavourite
  // ) );
  // }

  //редактирование

  void onChange(BuildContext context, int index) async {
  var deckList = HiveBox.decks.values.toList();
  var deck = deckList[noteToDeckIndex]; // Получаем нужный объект DeckData

  
  if ( deck.notes!.length < 4) {
    deck.notes![index] = NoteData(
      word: wordController.text,
      sentence: sentenceController.text,
    );

    // Сохраняем обновленный объект DeckData
    await HiveBox.decks.putAt(noteToDeckIndex, deck).then((value) => Navigator.pop(context),);

    print('Работает onChange');
  } else {
    print('Ошибка: Неверный индекс или пустой список заметок.');
  }
}


// установка поле ввода значние при редактиировании

  void setControllers(int index) {
    final note = HiveBox.decks.values.toList()[noteToDeckIndex].notes?[index];
    wordController.text = note?.word ?? '';
    sentenceController.text = note?.sentence ?? '';
    editingIndex = index;
  }


  void getNoteToDeckIndex({required int index}){
    noteToDeckIndex = index;
  }
}
