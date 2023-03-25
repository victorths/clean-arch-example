import 'package:eng_gruposbf_mobile_flutter/modules/cart/cart_controller.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/cart/cart_widget.dart';

import '../../commons/commons.dart';

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
