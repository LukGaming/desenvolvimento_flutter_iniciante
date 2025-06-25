import 'package:desenvolvimento_flutter_iniciante/extensions/extensions.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:flutter/material.dart';

class PessoaListTile extends StatefulWidget {
  final Pessoa pessoa;
  const PessoaListTile({
    super.key,
    required this.pessoa,
  });

  @override
  State<PessoaListTile> createState() => _PessoaListTileState();
}

class _PessoaListTileState extends State<PessoaListTile> {
  @override
  void initState() {
    print("Iniciando pessoa: ${widget.pessoa.id}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrangeAccent,
      child: ListTile(
        leading: Text("Id: ${widget.pessoa.id}"),
        title: Text(widget.pessoa.nome),
        subtitle: Text("Peso: ${widget.pessoa.peso.paraPeso()}"),
        trailing: Text("Altura: ${widget.pessoa.altura.paraAltura()}"),
      ),
    );
  }

  @override
  void dispose() {
    print("removendo pessoa: ${widget.pessoa.id}");
    super.dispose();
  }
}
