import 'package:flutter/material.dart';
class ContainerWidgetExample extends StatelessWidget {
  const ContainerWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.blueAccent,
        child:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 5.0),
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.deepOrange
            ),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              transform: Matrix4.rotationZ(-0.1),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(30), right: Radius.circular(10))
              ),
            ),
          ),
        ),
      ),
    );
  }
}
