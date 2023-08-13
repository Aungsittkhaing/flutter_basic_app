import 'package:flutter/material.dart';
class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Simple Text Widget',
        style: TextStyle(
            fontSize: 32.0,
            color: Colors.blueAccent,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.lineThrough
        ),
      ),
    );
  }
}