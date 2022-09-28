// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json, String id, bool fav) =>
    Product(
      id: id,
      category:
          (json['category'] as List<dynamic>).map((e) => e as String).toList(),
      subcategory: json['subcategory'] as String,
      title: json['title'] as String,
      shortName: json['shortName'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      shippingFee: json['shippingFee'] as num,
      seller: json['seller'] as String,
      specification: json['specification'] as String?,
      keyFeatures: json['keyFeatures'] as String?,
      totalrating: (json['totalrating'] as num?)?.toDouble(),
      otherImages: (json['otherImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      variation: (json['variation'] as List<dynamic>?)
          ?.map(
            (e) => e as String,
          )
          .toList(),
      colorImages: (json['colorImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      oldPrice: json['oldPrice'] as int?,
      isFavourite: fav,
      isRecommended: json['isRecommended'] as bool? ?? false,
      isFlashSale: json['isFlashSale'] as bool? ?? false,
      isTrending: json['isTrending'] as bool? ?? false,
      isFreeDelivery: json['isFreeDelivery'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'title': instance.title,
      'shortName': instance.shortName,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
      'shippingFee': instance.shippingFee,
      'seller': instance.seller,
      'specification': instance.specification,
      'keyFeatures': instance.keyFeatures,
      'otherImages': instance.otherImages,
      'variation': instance.variation,
      'colorImages': instance.colorImages,
      'oldPrice': instance.oldPrice,
      'totalrating': instance.totalrating,
      'isFavourite': instance.isFavourite,
      'isRecommended': instance.isRecommended,
      'isFlashSale': instance.isFlashSale,
      'isTrending': instance.isTrending,
      'isFreeDelivery': instance.isFreeDelivery,
    };
