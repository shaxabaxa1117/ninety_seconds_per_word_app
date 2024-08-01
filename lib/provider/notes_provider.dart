import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';

class NotesProvider extends ChangeNotifier {
  // controllers

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

  void deleteNote(int index) async {
    await HiveBox.notes.deleteAt(index);
  }

  //* check note
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
    await HiveBox.notes.putAt(index ,NoteData(word: wordController.text,sentence: sentenceController.text))
        .then(
          (value) => Navigator.pop(context),
        );
        print('работает  onChange');
  }

// установка поле ввода значние при редактиировании

  void setControllers(int index) {
    final note = HiveBox.notes.getAt(index) as NoteData;
    wordController.text = note.word ?? '';
    sentenceController.text = note.sentence ?? '';
    editingIndex = index;
  }
}
