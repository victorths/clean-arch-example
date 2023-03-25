import '../../commons/commons.dart';

class CartStore extends StateStore {
  // Temporário até finalizar o módulo de carrinho
  int get itemsOnCart => 2.obs.value;
}
