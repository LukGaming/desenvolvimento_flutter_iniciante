import 'package:desenvolvimento_flutter_iniciante/models/criar_pesso_dto.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/states/messages_states.dart';
import 'package:flutter/material.dart';

class PessoaController extends ChangeNotifier {
  List<Pessoa> _pessoas = [];
  List<Pessoa> get pessoas => _pessoas;

  ValueNotifier<MessagesStates> mensagemNotifier =
      ValueNotifier(IddleMessage());

  void adicionarPessoa(CriarPessoaDto criarPessoa) {
    try {
      final pessoa = Pessoa(
        id: _pessoas.length + 1,
        nome: criarPessoa.nome,
        altura: criarPessoa.altura,
        peso: criarPessoa.peso,
      );

      _pessoas.add(pessoa);
      mensagemNotifier.value =
          SuccessMessage(message: "Pessoa adicionada com sucesso.");
      notifyListeners();
    } on Exception catch (error) {
      mensagemNotifier.value =
          ErrorMessage(message: "Ocorreu um erro ao adicionar pessoa");
    }
  }

  void removerPessoa(Pessoa pessoa) {
    _pessoas.remove(pessoa);
    mensagemNotifier.value =
        SuccessMessage(message: "Pessoa removida com sucesso.");
    notifyListeners();
  }
}
