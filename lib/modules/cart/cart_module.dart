import 'package:eng_gruposbf_mobile_flutter/modules/cart/cart_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../commons/presentation/navigation/routes.dart';

class CartModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Paths.root, child: (context, args) => const CartWidget()),
      ];
}
