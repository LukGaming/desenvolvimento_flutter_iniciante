import 'package:flutter/material.dart';

class DefaultDialogContainer extends StatelessWidget {
  final Widget child;
  const DefaultDialogContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
