import 'dart:math';
import 'package:flutter/material.dart';
class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  final rand = Random();
  double width = 100;
  double height = 100;
  double radius = 8;
  Color color = Colors.purple;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container'),),
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
                duration: const Duration(seconds: 1),
              width: width,
              height: height,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
              ),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(),
            ),
            ElevatedButton.icon(
              label: const Text('Change Random property'),
              icon: const Icon(Icons.update),
                onPressed: (){
                setState(() {
                  width = rand.nextInt(100).toDouble() + 50;
                  height = rand.nextInt(100).toDouble() + 50;
                  radius = rand.nextInt(100).toDouble() + 50;
                  color = Color.fromRGBO(
                      rand.nextInt(256),
                      rand.nextInt(256),
                      rand.nextInt(256),
                      1
                  );
                });
                },
            )
          ],
        ),
      ),
    );
  }
}
