// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReviewsVOAdapter extends TypeAdapter<ReviewsVO> {
  @override
  final int typeId = 4;

  @override
  ReviewsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewsVO(
      rating: fields[0] as int?,
      comment: fields[1] as String?,
      date: fields[2] as String?,
      reviewerName: fields[3] as String?,
      reviewerEmail: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReviewsVO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.rating)
      ..writeByte(1)
      ..write(obj.comment)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.reviewerName)
      ..writeByte(4)
      ..write(obj.reviewerEmail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewsVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
