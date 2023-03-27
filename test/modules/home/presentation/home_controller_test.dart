import 'package:eng_gruposbf_mobile_flutter/commons/commons.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/cart/presentation/cart_store.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/entities/promotion.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/use_cases/get_promotions_use_case.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/home/presentation/home_controller.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/home/presentation/home_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mocks/navigate_mock.dart';

class PromotionEntityFake extends Fake implements PromotionEntity {}

class GetPromotionsUseCaseSpy extends Mock implements GetPromotionsUseCase {}

void main() {
  late HomeStore store;
  late CartStore cartStore;
  late HomeController controller;
  late GetPromotionsUseCase getPromotionsUseCase;
  late IModularNavigator navigator;

  final List<PromotionEntityFake> promotions = [
    for (int i = 0; i < 10; i++) PromotionEntityFake(),
  ];

  void mockPushNamed() {
    when(
      () => navigator.pushNamed(
        any(),
        arguments: any(named: 'arguments'),
      ),
    ).thenAnswer((_) async => null);
  }

  group('HomeController', () {
    setUp(() {
      store = HomeStore();
      cartStore = CartStore();

      navigator = MockNavigator();
      Modular.navigatorDelegate = navigator;

      getPromotionsUseCase = GetPromotionsUseCaseSpy();

      controller = HomeController(
        store: store,
        cartStore: cartStore,
        getPromotionsUseCase: getPromotionsUseCase,
      );

      registerFallbackValue(StackTrace.current);
      mockPushNamed();
    });

    group('addItemOnCart', () {
      test('should add items on cart', () {
        final item = PromotionEntityFake();

        controller.addItemOnCart(item);
        controller.addItemOnCart(item);

        expect(cartStore.itemsOnCart, isNotEmpty);
        expect(cartStore.itemsOnCart, contains(item));
        expect(cartStore.itemsOnCart[item], equals(2));
      });
    });

    group('fetchPromotions', () {
      test('should load the list of Promotions on store when success',
          () async {
        when(
          () => getPromotionsUseCase(),
        ).thenAnswer((_) => Future.value(promotions));

        await controller.fetchPromotions();

        expect(store.promotions, isA<List<PromotionEntity>>());
        expect(store.promotions.length, equals(10));
        expect(store.status, StateStoreStatus.completed);
      });

      test('should call ErrorPage when getPromotionsUseCase failed', () async {
        when(
          () => getPromotionsUseCase(),
        ).thenThrow(Exception());

        await controller.fetchPromotions();

        verify(
          () => navigator.pushNamed(
            Routes.error,
            arguments: controller.fetchPromotions,
          ),
        );
        expect(store.promotions, isEmpty);
        expect(store.status, StateStoreStatus.error);
      });
    });
  });
}
