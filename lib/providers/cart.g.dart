// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      id: json['id'] as String,
      title: json['title'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as num,
      image: json['image'] as String,
      shipping: json['shipping'] as num,
      variation: json['variation'] as String?,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'quantity': instance.quantity,
      'price': instance.price,
      'image': instance.image,
      'shipping': instance.shipping,
      'variation': instance.variation,
    };
