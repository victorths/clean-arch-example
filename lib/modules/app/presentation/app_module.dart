import 'package:flutter_modular/flutter_modular.dart';

import '../../../commons/presentation/navigation/routes.dart';
import '../../cart/cart_module.dart';
import '../../home/home_module.dart';
import 'app_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

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
        RedirectRoute(Routes.root, to: Routes.home)
      ];
}
