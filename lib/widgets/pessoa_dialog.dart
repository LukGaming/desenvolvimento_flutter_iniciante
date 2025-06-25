import 'package:desenvolvimento_flutter_iniciante/extensions/extensions.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/default_dialog_container.dart';
import 'package:flutter/material.dart';

class PessoaDialog extends StatelessWidget {
  final void Function(Pessoa pessoa) onDeletePessoa;
  final Pessoa pessoa;
  const PessoaDialog({
    super.key,
    required this.pessoa,
    required this.onDeletePessoa,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                onDeletePessoa(pessoa);
                Navigator.of(context).pop();
              },
              child: Text(
                "Excluir",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Fechar",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
      content: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Informações do usuário"),
            SizedBox(height: 8),
            DefaultDialogContainer(
              child: Text("Id: ${pessoa.id}"),
            ),
            DefaultDialogContainer(
              child: Text("Nome: ${pessoa.nome}"),
            ),
            DefaultDialogContainer(
              child: Text("Peso: ${pessoa.peso.paraPeso()}"),
            ),
            DefaultDialogContainer(
              child: Text("altura: ${pessoa.altura.paraAltura()}"),
            ),
          ],
        ),
      ),
    );
  }
}
