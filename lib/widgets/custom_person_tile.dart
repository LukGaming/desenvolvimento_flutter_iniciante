import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/custom_tile.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/pessoa_dialog.dart';
import 'package:flutter/material.dart';

class CustomPersonTile extends StatelessWidget {
  final void Function(Pessoa pessoa) onDeletePessoa;
  final Pessoa pessoa;
  const CustomPersonTile({
    super.key,
    required this.pessoa,
    required this.onDeletePessoa,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      onTap: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return PessoaDialog(
              pessoa: pessoa,
              onDeletePessoa: onDeletePessoa,
            );
          },
        );
      },
      color: Colors.lightBlue,
      leading: Text("Id: ${pessoa.id}"),
      title: Text(
        pessoa.nome,
        style: TextStyle(fontSize: 20),
      ),
      subTitle: Text("Peso: ${pessoa.peso.toStringAsFixed(1)} Kg"),
      trailing: Text("Altura: ${pessoa.altura} cm"),
    );
  }
}
