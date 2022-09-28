// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleReview _$ReviewFromJson(Map<String, dynamic> json) => SingleReview(
      id: json['id'] as String,
      prodid: json['prodid'] as String,
      time: DateTime.parse(json['time'] as String),
      rating: (json['rating'] as num).toDouble(),
      review: json['review'] as String,
    );

Map<String, dynamic> _$ReviewToJson(SingleReview instance) => <String, dynamic>{
      'id': instance.id,
      'prodid': instance.prodid,
      'time': instance.time.toIso8601String(),
      'rating': instance.rating,
      'review': instance.review,
    };
