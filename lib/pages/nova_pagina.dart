import 'package:desenvolvimento_flutter_iniciante/extensions/extensions.dart';
import 'package:flutter/material.dart';

class NovaPagina extends StatelessWidget {
  const NovaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova página"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: Text("Voltar"),
        ),
      ),
    );
  }
}
