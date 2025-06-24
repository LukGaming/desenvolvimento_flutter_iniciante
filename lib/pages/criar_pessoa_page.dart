import 'package:flutter/material.dart';

class CriarPessoaPage extends StatefulWidget {
  const CriarPessoaPage({super.key});

  @override
  State<CriarPessoaPage> createState() => _CriarPessoaPageState();
}

class _CriarPessoaPageState extends State<CriarPessoaPage> {
  final gap = SizedBox(height: 16);
  final nomeController = TextEditingController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova página"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nomeController,
              decoration: InputDecoration(
                label: Text("Nome"),
                border: OutlineInputBorder(),
              ),
            ),
            gap,
            TextFormField(
              controller: pesoController,
              decoration: InputDecoration(
                label: Text("Peso"),
                border: OutlineInputBorder(),
              ),
            ),
            gap,
            TextFormField(
              controller: alturaController,
              decoration: InputDecoration(
                label: Text("Altura"),
                border: OutlineInputBorder(),
              ),
            ),
            gap,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      print("Valor do nome: ${nomeController.text}");
                      print("Valor da altura: ${alturaController.text}");
                      print("Valor do peso: ${pesoController.text}");
                    },
                    child: Text("Salvar"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
