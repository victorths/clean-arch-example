import 'package:eng_gruposbf_mobile_flutter/commons/data/infra/dio_datasource.dart';

import '../../../commons/commons.dart';
import '../../cart/presentation/cart_module.dart';
import '../../cart/presentation/cart_store.dart';
import '../../home/presentation/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Essa dependência é compartilhada para exibição da quantidade de items no carrinho no AppBar
        Bind.singleton(
          (i) => CartStore(),
        ),
        Bind.singleton<RemoteDatasource>(
          (i) => DioDatasource(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Paths.home,
          module: HomeModule(),
        ),
        ModuleRoute(
          Paths.cart,
          module: CartModule(),
        ),
      ];
}
