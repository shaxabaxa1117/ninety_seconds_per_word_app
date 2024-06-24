









import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';

class NotesProvider extends ChangeNotifier{

  // controllers
  
  final wordController = TextEditingController();
  final sentenceController = TextEditingController();

  // add notes

//! View
  Future<void> addNote() async{

    await HiveBox.notes.add(
      NoteData(
        word: wordController.text.isNotEmpty ? wordController.text : 'No word mentioned',
        sentence: sentenceController.text.isNotEmpty ? sentenceController.text : 'No sentence is given',
      )
    ).then((value) => controllersClear());
  }


  // очищение контрллера
  controllersClear(){
    wordController.clear();
    sentenceController.clear();
  }

//* Deleting

  Future<void> deleteNote(int index) async{

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

//     Future<void> onChange(BuildContext context, int index) async{

//     await HiveBox.notes.putAt(index, NotesData(
//       title: titleController.text,
//       text: textController.text,

//     )).then((value) => Navigator.pop(context));


// }

//установка поле ввода значние при редактиировании 

  // Future<void> setControllers(int index) async{
  // titleController.text = HiveBox.notes.getAt(index)?.title ?? '';
  // textController.text = HiveBox.notes.getAt(index)?.text ?? '';
  // }

}