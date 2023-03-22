import 'package:eng_gruposbf_mobile_flutter/commons/presentation/controllers/page_life_cycle_controller.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/cart/cart_store.dart';

class CartController extends PageLifeCycleController<CartStore> {
  CartController({
    required this.store,
  });

  @override
  final CartStore store;
}
