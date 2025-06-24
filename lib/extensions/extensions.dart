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
