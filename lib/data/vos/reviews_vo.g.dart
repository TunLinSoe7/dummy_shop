// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsVO _$ReviewsVOFromJson(Map<String, dynamic> json) => ReviewsVO(
      rating: (json['rating'] as num?)?.toInt(),
      comment: json['comment'] as String?,
      date: json['date'] as String?,
      reviewerName: json['reviewerName'] as String?,
      reviewerEmail: json['reviewerEmail'] as String?,
    );

Map<String, dynamic> _$ReviewsVOToJson(ReviewsVO instance) => <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date,
      'reviewerName': instance.reviewerName,
      'reviewerEmail': instance.reviewerEmail,
    };
