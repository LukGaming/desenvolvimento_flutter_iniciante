import 'package:desenvolvimento_flutter_iniciante/models/criar_pesso_dto.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/lista_pessoas.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pessoa> pessoas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu primeiro App."),
      ),
      body: ListaPessoas(
        pessoas: pessoas,
        onDeletePessoa: (pessoa) {
          pessoas.remove(pessoa);
          setState(() {});
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () async {
          final result =
              await Navigator.of(context).pushNamed(Routes.criarPessoaPage);

          if (result != null) {
            final pessoaDto = result as CriarPessoDto;

            final pessoa = Pessoa(
              id: pessoas.length + 1,
              nome: pessoaDto.nome,
              altura: pessoaDto.altura,
              peso: pessoaDto.peso,
            );

            pessoas.add(pessoa);
            setState(() {});
          }

          print("resultado: $result");
          // context.pushNamed(Routes.criarPessoaPage);

          // Navigator.of(context).pushAndRemoveUntil(
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return NovaPagina();
          //     },
          //   ),
          //   (route) => false,
          // );
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
