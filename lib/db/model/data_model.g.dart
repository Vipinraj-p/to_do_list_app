// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDOListModelAdapter extends TypeAdapter<ToDOListModel> {
  @override
  final int typeId = 1;

  @override
  ToDOListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDOListModel(
      title: fields[2] as String,
      details: fields[3] as String,
      id: fields[0] as int?,
      CheckBoxValue: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ToDOListModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.CheckBoxValue)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDOListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
