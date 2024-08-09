import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dimensions_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class DimensionsVO {
  @JsonKey(name: 'width')
  @HiveField(0)
  double? width;
  @JsonKey(name: 'height')
  @HiveType(typeId: 1)
  double? height;
  @JsonKey(name: 'depth')
  @HiveField(2)
  double? depth;

  DimensionsVO({this.width, this.height, this.depth});

  factory DimensionsVO.fromJson(Map<String, dynamic> json) =>_$DimensionsVOFromJson(json);

  Map<String, dynamic> toJson() =>_$DimensionsVOToJson(this);
}