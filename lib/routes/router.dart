import 'package:desenvolvimento_flutter_iniciante/pages/home_page.dart';
import 'package:desenvolvimento_flutter_iniciante/pages/nova_pagina.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  Routes.initialRoute: (BuildContext context) => HomePage(),
  Routes.novaPagina: (BuildContext context) => NovaPagina(),
};
