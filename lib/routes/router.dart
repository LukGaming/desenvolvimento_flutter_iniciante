import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/pages/home_page.dart';
import 'package:desenvolvimento_flutter_iniciante/pages/criar_pessoa_page.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  Routes.initialRoute: (BuildContext context) => HomePage(),
  Routes.criarPessoaPage: (BuildContext context) {
    final params =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final pessoa = params?["pessoa"] as Pessoa?;
    return CriarPessoaPage(
      pessoa: pessoa,
    );
  },
};
