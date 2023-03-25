import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/entities/promotion.dart';

import '../../../commons/commons.dart';

class CartStore extends StateStore {
  final itemsOnCart = RxMap<PromotionEntity, int>({});
  int get itemsOnCartCount => itemsOnCart.length;
}
