import '../../../commons/commons.dart';
import 'cart_store.dart';

class CartController extends PageLifeCycleController<CartStore> {
  CartController({
    required this.store,
  });

  @override
  final CartStore store;

  void checkout() {
    store.itemsOnCart.clear();
  }
}
