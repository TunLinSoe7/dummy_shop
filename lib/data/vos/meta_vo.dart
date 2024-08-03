import 'package:json_annotation/json_annotation.dart';
part 'meta_vo.g.dart';
@JsonSerializable()
class MetaVO {
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: 'barcode')
  String? barcode;
  @JsonKey(name: 'qrCode')
  String? qrCode;

  MetaVO({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory MetaVO.fromJson(Map<String, dynamic> json) =>_$MetaVOFromJson(json);

  Map<String, dynamic> toJson() =>_$MetaVOToJson(this);
}