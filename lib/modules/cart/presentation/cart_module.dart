import '../../../commons/commons.dart';
import 'cart_controller.dart';
import 'cart_widget.dart';

class CartModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => CartController(
            store: i(),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Paths.root, child: (context, args) => const CartWidget()),
      ];
}
