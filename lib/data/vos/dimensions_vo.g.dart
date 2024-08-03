// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dimensions_vo.dart';

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
