import 'dart:io';

import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

import '../../domain/entities/enums.dart';

abstract class StateStore {
  final Rx<StateStoreStatus> _status =
      Rx<StateStoreStatus>(StateStoreStatus.loading);
  final Rxn<String?> _error = Rxn<String>();

  StateStoreStatus get status => _status.value;
  Rx<StateStoreStatus> get rxStatus => _status;
  String? get error => _error.value;
  Rx<String?> get rxError => _error;

  set status(StateStoreStatus value) => _status.value = value;
  set error(String? value) {
    _status.value = StateStoreStatus.error;
    if (value != null && value.isNotEmpty) {
      if (!Platform.environment.containsKey('FLUTTER_TEST')) {
        showToast(value);
      }
      _error.value = value;
    }
  }

  void completed([String? value]) {
    _status.value = StateStoreStatus.completed;
    if (value != null && value.isNotEmpty) {
      if (!Platform.environment.containsKey('FLUTTER_TEST')) {
        showToast(value);
      }
    }
  }

  void loading() => _status.value = StateStoreStatus.loading;
  void noContent() => _status.value = StateStoreStatus.noContent;

  bool get isLoading => status == StateStoreStatus.loading;
  bool get hasError => status == StateStoreStatus.error;
  bool get isCompleted => status == StateStoreStatus.completed;
}
