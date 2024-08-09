import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reviews_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class ReviewsVO {
  @JsonKey(name: 'rating')
  @HiveField(0)
  int? rating;
  @JsonKey(name: 'comment')
  @HiveField(1)
  String? comment;
  @JsonKey(name: 'date')
  @HiveField(2)
  String? date;
  @JsonKey(name: 'reviewerName')
  @HiveField(3)
  String? reviewerName;
  @JsonKey(name: 'reviewerEmail')
  @HiveField(4)
  String? reviewerEmail;

  ReviewsVO(
      {this.rating,
        this.comment,
        this.date,
        this.reviewerName,
        this.reviewerEmail});

  factory ReviewsVO.fromJson(Map<String, dynamic> json) =>_$ReviewsVOFromJson(json);

  Map<String, dynamic> toJson() =>_$ReviewsVOToJson(this);
}
