import 'package:json_annotation/json_annotation.dart';
part 'dimensions_vo.g.dart';

@JsonSerializable()
class DimensionsVO {
  @JsonKey(name: 'width')
  double? width;
  @JsonKey(name: 'height')
  double? height;
  @JsonKey(name: 'depth')
  double? depth;

  DimensionsVO({this.width, this.height, this.depth});

  factory DimensionsVO.fromJson(Map<String, dynamic> json) =>_$DimensionsVOFromJson(json);

  Map<String, dynamic> toJson() =>_$DimensionsVOToJson(this);
}