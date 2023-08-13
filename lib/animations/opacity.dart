import 'package:flutter/material.dart';
class OpacityExample extends StatefulWidget {
  const OpacityExample({super.key});

  @override
  State<OpacityExample> createState() => _OpacityExampleState();
}

class _OpacityExampleState extends State<OpacityExample> {
  double opacity1 = 1.0, opacity2 = 1.0, opacity3 = 1.0;
  Widget coloredSquare(Color color){
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
                "Click on colored square to make them invisible,click to see them again"
            ),
            GestureDetector(
              onTap: ()=> setState(() {
                opacity1 = 1.0 - opacity1;
              }),
              child: Opacity(
                opacity: opacity1,
                child: coloredSquare(Colors.red),
              ),
            ),
            GestureDetector(
              onTap: ()=> setState(() {
                opacity2 = 1.0 - opacity2;
              }),
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: opacity2,
                child: coloredSquare(Colors.green),
              ),
            ),
            GestureDetector(
              onTap: ()=> setState(() {
                opacity3 = 1.0 - opacity3;
              }),
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: opacity3,
                child: coloredSquare(Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

