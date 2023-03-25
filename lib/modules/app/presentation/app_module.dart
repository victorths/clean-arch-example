import 'package:eng_gruposbf_mobile_flutter/modules/cart/cart_store.dart';

import '../../../commons/commons.dart';
import '../../cart/cart_module.dart';
import '../../home/presentation/home_module.dart';
import 'app_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Essa dependência é compartilhada para exibição da quantidade de items no carrinho no AppBar
        Bind.singleton(
          (i) => CartStore(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Paths.root,
          child: (context, args) => const AppPage(),
          children: [
            ModuleRoute(
              Paths.home,
              module: HomeModule(),
            ),
            ModuleRoute(
              Paths.cart,
              module: CartModule(),
            ),
          ],
        ),
      ];
}
