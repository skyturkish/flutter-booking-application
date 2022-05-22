// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostUserModelAdapter extends TypeAdapter<PostUserModel> {
  @override
  final int typeId = 9;

  @override
  PostUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostUserModel(
      id: fields[0] as int?,
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PostUserModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
