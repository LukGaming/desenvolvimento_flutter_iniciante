import 'package:desenvolvimento_flutter_iniciante/mock/gerar_pessoas.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/pessoa_listtile.dart';
import 'package:flutter/material.dart';

class ListaPessoas extends StatelessWidget {
  const ListaPessoas({super.key});

  @override
  Widget build(BuildContext context) {
    final pessoas = gerarPessoas(20);

    return ListView.builder(
      itemCount: pessoas.length,
      itemBuilder: (context, index) {
        return PessoaListTile(pessoa: pessoas[index]);
      },
    );
  }
}
