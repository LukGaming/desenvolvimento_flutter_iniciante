import 'package:desenvolvimento_flutter_iniciante/controllers/pessoa_controller.dart';
import 'package:desenvolvimento_flutter_iniciante/models/criar_pesso_dto.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class CriarPessoaPage extends StatefulWidget {
  final Pessoa? pessoa;
  const CriarPessoaPage({
    super.key,
    required this.pessoa,
  });

  @override
  State<CriarPessoaPage> createState() => _CriarPessoaPageState();
}

class _CriarPessoaPageState extends State<CriarPessoaPage> {
  final gap = SizedBox(height: 16);
  final nomeController = TextEditingController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final pessoaController = GetIt.instance<PessoaController>();
  bool isEditing = false;

  @override
  void initState() {
    if (widget.pessoa != null) {
      isEditing = true;
      Pessoa pessoa = widget.pessoa!;
      nomeController.text = pessoa.nome;
      pesoController.text = pessoa.peso.toString().replaceAll(".", ",");
      alturaController.text = pessoa.altura.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova página"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Por favor, preencha o nome.";
                  }
                  final nomeCompleto = value!.split(" ");

                  if (nomeCompleto.length < 2) {
                    return "Por favor, preencha o sobrenome";
                  }
                  return null;
                },
                controller: nomeController,
                decoration: InputDecoration(
                  label: Text("Nome completo"),
                  border: OutlineInputBorder(),
                ),
              ),
              gap,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+[,]?\d{0,1}'))
                ],
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Por favor, preencha o peso.";
                  }
                  return null;
                },
                controller: pesoController,
                decoration: InputDecoration(
                    label: Text("Peso"),
                    border: OutlineInputBorder(),
                    suffixText: "Kg (ex: 72,5)"),
              ),
              gap,
              TextFormField(
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Por favor, preencha a altura.";
                  }
                  return null;
                },
                controller: alturaController,
                decoration: InputDecoration(
                  label: Text("Altura"),
                  border: OutlineInputBorder(),
                  suffixText: "Cm (Ex: 180)",
                ),
              ),
              gap,
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState?.validate() == true) {
                          if (!isEditing) {
                            final criarPessoa = CriarPessoaDto(
                              nome: nomeController.text,
                              altura: int.parse(alturaController.text),
                              peso: double.parse(
                                  pesoController.text.replaceAll(",", ".")),
                            );

                            await pessoaController.adicionarPessoa(criarPessoa);
                          } else {
                            final pessoaAtualizada = widget.pessoa!.copyWith(
                              nome: nomeController.text,
                              altura: int.parse(alturaController.text),
                              peso: double.parse(
                                  pesoController.text.replaceAll(",", ".")),
                            );

                            await pessoaController
                                .atualizarPessoa(pessoaAtualizada);
                          }
                          if (context.mounted) Navigator.of(context).pop();
                        }
                      },
                      child: Text("Salvar"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }
}
