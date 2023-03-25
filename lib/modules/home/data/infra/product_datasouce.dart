import 'package:eng_gruposbf_mobile_flutter/commons/commons.dart';

import '../models/promotion_model.dart';

class ProductDatasource {
  ProductDatasource({
    required this.remoteDatasource,
  });

  final RemoteDatasource remoteDatasource;

  Future<List<PromotionModel>> getPromotions() async {
    try {
      final response = await remoteDatasource.get(url: '/promotions');
      return response
          .cast<Map<String, dynamic>>()
          .map<PromotionModel>((json) => PromotionModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception(
          'Error fecthing promotions from remote datasouce: ${e.toString()}');
    }
  }
}
