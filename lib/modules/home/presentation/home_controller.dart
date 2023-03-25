import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/use_cases/get_promotions.dart';

import '../../../commons/commons.dart';
import '../../cart/presentation/cart_store.dart';
import 'home_store.dart';

class HomeController extends PageLifeCycleController<HomeStore> {
  HomeController({
    required this.store,
    required this.cartStore,
    required this.getPromotionsUseCase,
  });

  @override
  final HomeStore store;
  final CartStore cartStore;
  final GetPromotionsUseCase getPromotionsUseCase;

  @override
  void onReady() {
    fetchPromotions();
    super.onReady();
  }

  Future fetchPromotions() async {
    try {
      store.loading();
      store.promotions.assignAll(await getPromotionsUseCase());
      // Coloquei um delay pra mostrar o loading haha
      await 1.delay();
      store.completed();
    } on Exception catch (e) {
      store.error = e;
    }
  }
}
