import 'package:flutter/material.dart';

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
