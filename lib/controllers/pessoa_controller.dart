import 'package:desenvolvimento_flutter_iniciante/models/criar_pesso_dto.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/services/api_client.dart';
import 'package:desenvolvimento_flutter_iniciante/states/messages_states.dart';
import 'package:flutter/material.dart';

class PessoaController extends ChangeNotifier {
  List<Pessoa> _pessoas = [];
  List<Pessoa> get pessoas => _pessoas;

  final apiClient = ApiClient();

  ValueNotifier<MessagesStates> mensagemNotifier =
      ValueNotifier(IddleMessage());
  bool _loading = false;
  bool get loading => _loading;
  void listarPessoas() async {
    _loading = true;
    notifyListeners();
    try {
      final pessoas = await apiClient.get();
      _pessoas = pessoas;
    } on Exception catch (error) {
      //TODO: tratamento da excessão
      print("error: $error");
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void adicionarPessoa(CriarPessoaDto criarPessoa) async {
    try {
      final pessoa = await apiClient.post(criarPessoa);

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
