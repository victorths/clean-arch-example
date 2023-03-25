import '../../../commons/commons.dart';
import '../../cart/cart_store.dart';
import 'home_store.dart';

class HomeController extends PageLifeCycleController<HomeStore> {
  HomeController({
    required this.store,
    required this.cartStore,
  });

  @override
  final HomeStore store;
  final CartStore cartStore;
}
