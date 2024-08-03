import 'package:json_annotation/json_annotation.dart';
part 'reviews_vo.g.dart';

@JsonSerializable()
class ReviewsVO {
  @JsonKey(name: 'rating')
  int? rating;
  @JsonKey(name: 'comment')
  String? comment;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'reviewerName')
  String? reviewerName;
  @JsonKey(name: 'reviewerEmail')
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
