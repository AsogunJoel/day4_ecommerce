// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json, String id) =>
    OrderItem(
      id: id,
      // json['id'] as String
      amount: json['amount'] as num,
      products: (json['products'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'products': instance.products.map((e) => e.toJson()).toList(),
      'dateTime': instance.dateTime.toIso8601String(),
    };
