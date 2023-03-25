import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/entities/promotion.dart';

import '../../../commons/commons.dart';

class HomeStore extends StateStore {
  final promotions = RxList<PromotionEntity>([]);
}
