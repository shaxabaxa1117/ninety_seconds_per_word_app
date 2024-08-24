
import 'package:hive/hive.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';
part 'deck_data.g.dart';

@HiveType(typeId: 1)

class DeckData{

  @HiveField(0)
String? name;

  @HiveField(1)
List<NoteData>? notes;

  @HiveField(2)
int? deckIndex;

  @HiveField(3)
  bool isFull;

DeckData({this.name, this.notes, this.isFull = false});

  get length => null;
}