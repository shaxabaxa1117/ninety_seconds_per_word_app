
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';

abstract class HiveBox{

  static final notes = Hive.box<NoteData>('notes');
}