import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/entities/promotion.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/repositories/product_repository.dart';

import '../infra/product_datasouce.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({
    required this.datasource,
  });

  final ProductDatasource datasource;

  @override
  Future<List<PromotionEntity>> getPromotions() => datasource.getPromotions();
}
