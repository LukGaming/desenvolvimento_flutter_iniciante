import 'package:desenvolvimento_flutter_iniciante/controllers/pessoa_controller.dart';
import 'package:desenvolvimento_flutter_iniciante/models/criar_pesso_dto.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/lista_pessoas.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pessoaController = GetIt.instance<PessoaController>();

  @override
  void initState() {
    pessoaController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu primeiro App."),
      ),
      body: ListaPessoas(
        pessoas: pessoaController.pessoas,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () async {
          final result =
              await Navigator.of(context).pushNamed(Routes.criarPessoaPage);

          if (result != null) {
            final pessoaDto = result as CriarPessoaDto;
            pessoaController.adicionarPessoa(pessoaDto);
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
