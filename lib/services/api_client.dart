import 'package:desenvolvimento_flutter_iniciante/models/criar_pesso_dto.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  final String apiUrl;

  ApiClient({required this.dio, required this.apiUrl});

  Future<List<Pessoa>> get() async {
    final request = await dio.get("$apiUrl/pessoas");

    if (request.statusCode == 200) {
      final data = request.data;

      final pessoasJson = data as List;

      return pessoasJson
          .map((pessoaJson) => Pessoa.fromJson(pessoaJson))
          .toList();
    }

    throw Exception("Status Code inválido");
  }

  Future<Pessoa> post(CriarPessoaDto criarPessoa) async {
    final request = await dio.post(
      "$apiUrl/pessoas",
      data: criarPessoa.toJson(),
    );

    if (request.statusCode == 201) {
      return Pessoa.fromJson(request.data);
    }

    throw Exception("Status code inválido");
  }

  Future<void> delete(Pessoa pessoa) async {
    final request = await dio.delete(
      "$apiUrl/pessoas/${pessoa.id}",
    );

    if (request.statusCode != 200) {
      throw Exception("Status code inválido");
    }
  }

  Future<Pessoa> put(Pessoa pessoa) async {
    final request = await dio.put(
      "$apiUrl/pessoas/${pessoa.id}",
      data: pessoa.toJson(),
    );
    if (request.statusCode == 200) {
      return Pessoa.fromJson(request.data);
    }
    throw Exception("Status code invalido");
  }
}

// Map<String, dynamic> pessoaJson = {
//   "id": "8554",
//   "nome": "Paulo",
//   "altura": 183,
//   "peso": 72.5
// };

// final List<Map<String, dynamic>> lista = [
//   {"id": "8554", "nome": "Paulo", "altura": 183, "peso": 72.5}
// ];
