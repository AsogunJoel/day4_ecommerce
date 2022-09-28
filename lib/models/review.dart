import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class SingleReview {
  final String id;
  final String prodid;
  final DateTime time;
  final double rating;
  final String review;

  SingleReview({
    required this.id,
    required this.prodid,
    required this.time,
    required this.rating,
    required this.review,
  });
  factory SingleReview.fromJson(Map<String, dynamic> data) =>
      _$ReviewFromJson(data);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
