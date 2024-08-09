// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dimensions_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DimensionsVOAdapter extends TypeAdapter<DimensionsVO> {
  @override
  final int typeId = 2;

  @override
  DimensionsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DimensionsVO(
      width: fields[0] as double?,
      depth: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, DimensionsVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.depth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DimensionsVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DimensionsVO _$DimensionsVOFromJson(Map<String, dynamic> json) => DimensionsVO(
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      depth: (json['depth'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DimensionsVOToJson(DimensionsVO instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
    };
