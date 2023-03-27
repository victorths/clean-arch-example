import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/entities/promotion.dart';

import '../repositories/product_repository.dart';

abstract class GetPromotionsUseCase {
  Future<List<PromotionEntity>> call();
}

class GetPromotionsUseCaseImpl implements GetPromotionsUseCase {
  GetPromotionsUseCaseImpl({
    required this.repository,
  });

  final ProductRepository repository;

  @override
  Future<List<PromotionEntity>> call() => repository.getPromotions();
}
