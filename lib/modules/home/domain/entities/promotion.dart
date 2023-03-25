import 'package:equatable/equatable.dart';

class PromotionEntity extends Equatable {
  final String? name;
  final String? image;
  final double? price;
  final double? oldPrice;
  final int rate;
  final int? reviews;
  final bool freeShipping;
  final int? discount;
  final String? id;
  final int? colors;

  const PromotionEntity({
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    this.rate = 0,
    required this.reviews,
    this.freeShipping = false,
    required this.discount,
    required this.id,
    required this.colors,
  });

  @override
  List<Object?> get props =>
      [id, name, price, oldPrice, discount, rate, reviews];
}
