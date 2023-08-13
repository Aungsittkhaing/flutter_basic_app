import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.image,
        size: 63.3,
        color: Colors.deepPurpleAccent,
      ),
    );
  }
}
