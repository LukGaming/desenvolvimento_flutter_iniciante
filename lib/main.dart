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
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Meu primeiro App."),
        ),
        body: MeuStatelessWidget(),
      ),
    );
  }
}

class MeuStatelessWidget extends StatefulWidget {
  const MeuStatelessWidget({super.key});

  @override
  State<MeuStatelessWidget> createState() => _MeuStatelessWidgetState();
}

class _MeuStatelessWidgetState extends State<MeuStatelessWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Count: $count",
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text("Clique aqui!"),
        ),
        MeuStateFulWidget(
          callback: () {
            setState(() {
              count++;
            });
          },
        ),
      ],
    );
  }
}

class MeuStateFulWidget extends StatefulWidget {
  final void Function() callback;
  const MeuStateFulWidget({
    super.key,
    required this.callback,
  });

  @override
  State<MeuStateFulWidget> createState() => _MeuStateFulWidgetState();
}

class _MeuStateFulWidgetState extends State<MeuStateFulWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            widget.callback.call();
          },
          child: Text(
            "Botão de baixo",
          ),
        ),
      ],
    );
  }
}
