// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_vo.dart';

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
