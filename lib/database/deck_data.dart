
import 'package:hive/hive.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';
part 'deck_data.g.dart';

@HiveType(typeId: 1)

class DeckData{

  @HiveField(0)
String? name;

  @HiveField(1)
List<NoteData>? notes;


DeckData({this.name, this.notes});
}