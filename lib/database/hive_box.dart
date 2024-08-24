
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ninenty_second_per_word_app/database/deck_data.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';


abstract class HiveBox{

  static final Box<NoteData> notes = Hive.box<NoteData>('notes');
  static final Box<int> picIndex = Hive.box<int>('picIndex');
  static final Box<DeckData> decks = Hive.box<DeckData>('decks');

  

}