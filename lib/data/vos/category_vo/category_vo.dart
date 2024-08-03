import 'package:json_annotation/json_annotation.dart';
part 'category_vo.g.dart';

@JsonSerializable()
class CategoryVO {
  @JsonKey(name: 'slug')
  String? slug;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'url')
  String? url;

  CategoryVO({this.slug, this.name, this.url});

  factory CategoryVO.fromJson(Map<String, dynamic> json) =>_$CategoryVOFromJson(json);

  Map<String, dynamic> toJson() =>_$CategoryVOToJson(this);
}