
import 'package:hive/hive.dart';
part 'note_data.g.dart';

@HiveType(typeId: 0)
class NoteData{

  @HiveField(0)
String? word;

  @HiveField(1)
String? sentence;

  @HiveField(2)
bool isFavourite;

  @HiveField(3)
String? deckName;



NoteData({this.word,this.sentence, this.isFavourite = false, this.deckName});

}