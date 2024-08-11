import 'package:json_annotation/json_annotation.dart';

part 'promo_vo.g.dart';
@JsonSerializable()
class PromoVO{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name :'image')
  String? image;

  PromoVO({required this.id,required this.image});
  factory PromoVO.fromJson(Map<String,dynamic> json)=>_$PromoVOFromJson(json);
}