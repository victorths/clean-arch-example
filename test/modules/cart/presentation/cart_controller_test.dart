import 'package:eng_gruposbf_mobile_flutter/modules/cart/presentation/cart_controller.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/cart/presentation/cart_store.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/entities/promotion.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PromotionEntityFake extends Fake implements PromotionEntity {}

void main() {
  late CartStore store;
  late CartController controller;

  final List<PromotionEntityFake> promotions = [
    for (int i = 0; i < 10; i++) PromotionEntityFake(),
  ];

  group('CartController', () {
    setUp(() {
      store = CartStore();

      controller = CartController(
        store: store,
      );

      registerFallbackValue(StackTrace.current);
    });

    group('checkout', () {
      test('should clear the list of Promotions on store when checkout success',
          () async {
        store.itemsOnCart
            .addAll(Map.fromEntries(promotions.map((e) => MapEntry(e, 1))));

        expect(store.itemsOnCart, isA<Map<PromotionEntity, int>>());
        expect(store.itemsOnCart.entries.length, equals(10));

        controller.checkout();

        expect(store.itemsOnCart, isEmpty);
      });
    });
  });
}
