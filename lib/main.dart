import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/lista_pessoas.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/pessoa_listtile.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/stateless_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          titleSmall: TextStyle(color: Colors.red),
          bodySmall: TextStyle(color: Colors.red),
          bodyMedium: TextStyle(color: Colors.black),
          displayMedium: TextStyle(color: Colors.red),
          bodyLarge: TextStyle(color: Colors.red),
          displaySmall: TextStyle(color: Colors.red),
          titleLarge: TextStyle(color: Colors.red),
          labelSmall: TextStyle(color: Colors.red),
          headlineLarge: TextStyle(color: Colors.red),
          titleMedium: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Meu primeiro App."),
        ),
        body: ListaPessoas(),
      ),
    );
  }
}
