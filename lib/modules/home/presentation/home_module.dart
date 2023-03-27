import 'package:eng_gruposbf_mobile_flutter/modules/home/data/infra/product_datasouce.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/use_cases/get_promotions_use_case.dart';

import '../../../commons/commons.dart';
import '../data/repositories/product_repository.dart';
import 'home_controller.dart';
import 'home_store.dart';
import 'home_widget.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => HomeController(
            store: HomeStore(),
            cartStore: i(),
            getPromotionsUseCase: GetPromotionsUseCaseImpl(
              repository: ProductRepositoryImpl(
                datasource: ProductDatasource(
                  remoteDatasource: i(),
                ),
              ),
            ),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Paths.root, child: (context, args) => const HomeWidget()),
      ];
}
