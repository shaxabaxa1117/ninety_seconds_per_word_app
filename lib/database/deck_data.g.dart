// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeckDataAdapter extends TypeAdapter<DeckData> {
  @override
  final int typeId = 1;

  @override
  DeckData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeckData(
      name: fields[0] as String?,
      notes: (fields[1] as List?)?.cast<NoteData>(),
      isFull: fields[3] as bool,
    )..deckIndex = fields[2] as int?;
  }

  @override
  void write(BinaryWriter writer, DeckData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.notes)
      ..writeByte(2)
      ..write(obj.deckIndex)
      ..writeByte(3)
      ..write(obj.isFull);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeckDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
