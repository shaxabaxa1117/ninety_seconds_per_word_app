import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';

class NotesProvider extends ChangeNotifier {
  // controllers

  final wordController = TextEditingController();
  final sentenceController = TextEditingController();

  // add notes

//! View
  Future<void> addNote(context) async {
    await HiveBox.notes
        .add(NoteData(
          word: wordController.text.isNotEmpty ? wordController.text: 'No word is mentioned',
          sentence: sentenceController.text.isNotEmpty? sentenceController.text: 'No sentence is given',))
        .then((value) => Navigator.pop(context)).then((value) => controllersClear());
        print('работает addNote');
  }

  // очищение контрллера
  controllersClear() {
    wordController.clear();
    sentenceController.clear();
  }

//* Deleting

  Future<void> deleteNote(int index) async {
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

  Future<void> onChange(BuildContext context, int index) async {
    await HiveBox.notes.putAt(index ,NoteData(word: wordController.text,sentence: sentenceController.text))
        .then(
          (value) => Navigator.pop(context),
        );
        print('работает  onChange');
  }

// установка поле ввода значние при редактиировании

  Future<void> setControllers(int index) async {
    wordController.text = HiveBox.notes.getAt(index)?.word ?? '';
    sentenceController.text = HiveBox.notes.getAt(index)?.sentence ?? '';
    print('работает  setControllers');
  }
}
