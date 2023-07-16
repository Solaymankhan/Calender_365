part of 'notes_model.dart';

class notesmodelAdapter extends TypeAdapter<notes_model> {
  @override
  final int typeId = 0;

  @override
  notes_model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return notes_model(
      date: fields[0] as DateTime,
      title: fields[1] as String,
      description: fields[2] as String,
      id: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, notes_model obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is notesmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
