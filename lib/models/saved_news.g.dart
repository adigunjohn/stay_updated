// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_news.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedNewsAdapter extends TypeAdapter<SavedNews> {
  @override
  final int typeId = 0;

  @override
  SavedNews read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedNews(
      url: fields[4] as String,
      publishedAt: fields[6] as String,
      author: fields[0] as String,
      description: fields[3] as String,
      content: fields[7] as String,
      sourceName: fields[1] as String,
      title: fields[2] as String,
      urlImage: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedNews obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.sourceName)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.urlImage)
      ..writeByte(6)
      ..write(obj.publishedAt)
      ..writeByte(7)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedNewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
