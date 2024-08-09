import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'meta_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: 3)
class MetaVO {
  @JsonKey(name: 'createdAt')
  @HiveField(0)
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  @HiveField(1)
  String? updatedAt;
  @JsonKey(name: 'barcode')
  @HiveField(2)
  String? barcode;
  @JsonKey(name: 'qrCode')
  @HiveField(3)
  String? qrCode;

  MetaVO({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory MetaVO.fromJson(Map<String, dynamic> json) =>_$MetaVOFromJson(json);

  Map<String, dynamic> toJson() =>_$MetaVOToJson(this);
}