import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'dart:math' show pi;
class GradientExample extends StatelessWidget {
  const GradientExample({super.key});

  @override
  Widget build(BuildContext context) {
    final txtStyle = Theme.of(context).textTheme.headlineMedium;
    return Scaffold(
      appBar: GradientAppBar(
        title: const Text('Gradient AppBar Example'),
        gradient: const LinearGradient(
          colors: [Colors.cyan, Colors.indigo]
        )
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.yellow, Colors.indigo, Colors.teal]
              )
            ),
            child: Text('Linear Gradient', style: txtStyle,),
          ),
          const Divider(),
          Container(
            height: 300,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                  radius: 1,
                  colors: [Colors.blue, Colors.red]
              )
            ),
            child: Text('Radial Gradient', style: txtStyle,),
          ),
          const Divider(),
          Container(
            height: 300,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(startAngle: pi / 6, endAngle: pi * 1.8,colors: [Colors.yellow, Colors.red]),
            ),
            child: Text('SweepGradient', style: txtStyle,),
          )
        ],
      ),
    );
  }
}
