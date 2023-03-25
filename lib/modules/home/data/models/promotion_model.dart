import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/entities/promotion.dart';

import '../../../../commons/commons.dart';

part 'promotion_model.g.dart';

@JsonSerializable(createToJson: false)
class PromotionModel extends PromotionEntity {
  const PromotionModel({
    super.name,
    super.image,
    super.price,
    super.oldPrice,
    super.rate,
    super.reviews,
    super.freeShipping,
    super.discount,
    super.id,
    super.colors,
  });

  factory PromotionModel.fromJson(Map<String, dynamic> json) =>
      _$PromotionModelFromJson(json);
}
