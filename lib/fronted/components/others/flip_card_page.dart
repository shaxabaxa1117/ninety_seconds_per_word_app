// ignore_for_file: prefer_const_constructors

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';




class WordFlipCard extends StatelessWidget {

  int index;
  WordFlipCard({super.key,required this.index});
  @override
  Widget build(BuildContext context) {
    var allDecks = HiveBox.decks.values.toList();
    var modelNote = context.watch<NotesProvider>();
    return 
          Scaffold(
            backgroundColor: Color.fromARGB(255, 34, 34, 34),
            appBar: AppBar(
          title: const Text(
            'Card',
            style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 59, 59, 59),
        ),
            body:  Center(
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL, // направление переворота (горизонтально или вертикально)
              front: Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color.fromARGB(255, 83, 95, 106),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        allDecks[modelNote.noteToDeckIndex].notes![index].word!,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    
                  ],
                ),
              ),
              back: Container(
                width: double.infinity,
                height: double.infinity,
                color: Color.fromARGB(255, 66, 48, 67),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        allDecks[modelNote.noteToDeckIndex].notes![index].sentence!,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
                    ),
          );
  }
}


// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'deck_data.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class DeckDataAdapter extends TypeAdapter<DeckData> {
//   @override
//   final int typeId = 1;

//   @override
//   DeckData read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return DeckData()
//       ..name = fields[0] as String?
//       ..notes = (fields[1] as List?)?.cast<NoteData>();
//   }

//   @override
//   void write(BinaryWriter writer, DeckData obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.name)
//       ..writeByte(1)
//       ..write(obj.notes);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is DeckDataAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
