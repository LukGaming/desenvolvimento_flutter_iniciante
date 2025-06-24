import 'package:flutter/material.dart';

extension ParaPeso on double {
  String paraPeso() {
    return "${toStringAsFixed(1)} Kg";
  }
}

extension ParaAltura on int {
  String paraAltura() {
    return "$this Cm";
  }
}

extension Navigate<T> on BuildContext {
  Future<T?> pushNamed(String route) async {
    return await Navigator.of(this).pushNamed(route);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
