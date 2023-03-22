import 'package:eng_gruposbf_mobile_flutter/commons/utils/modular_injector.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ModularInjector<HomeWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
