// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromotionModel _$PromotionModelFromJson(Map<String, dynamic> json) =>
    PromotionModel(
      name: json['name'] as String?,
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      rate: json['rate'] as int? ?? 0,
      reviews: json['reviews'] as int?,
      freeShipping: json['freeShipping'] as bool? ?? false,
      discount: json['discount'] as int?,
      id: json['id'] as String?,
      colors: json['colors'] as int?,
    );
