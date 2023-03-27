import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/entities/promotion.dart';

abstract class ProductRepository {
  Future<List<PromotionEntity>> getPromotions();
}
