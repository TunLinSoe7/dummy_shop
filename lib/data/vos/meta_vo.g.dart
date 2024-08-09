// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MetaVOAdapter extends TypeAdapter<MetaVO> {
  @override
  final int typeId = 3;

  @override
  MetaVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MetaVO(
      createdAt: fields[0] as String?,
      updatedAt: fields[1] as String?,
      barcode: fields[2] as String?,
      qrCode: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MetaVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.createdAt)
      ..writeByte(1)
      ..write(obj.updatedAt)
      ..writeByte(2)
      ..write(obj.barcode)
      ..writeByte(3)
      ..write(obj.qrCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaVO _$MetaVOFromJson(Map<String, dynamic> json) => MetaVO(
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      barcode: json['barcode'] as String?,
      qrCode: json['qrCode'] as String?,
    );

Map<String, dynamic> _$MetaVOToJson(MetaVO instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'barcode': instance.barcode,
      'qrCode': instance.qrCode,
    };
