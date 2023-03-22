import 'package:eng_gruposbf_mobile_flutter/commons/utils/modular_injector.dart';
import 'package:flutter/material.dart';

import 'cart_controller.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends ModularInjector<CartWidget, CartController> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
