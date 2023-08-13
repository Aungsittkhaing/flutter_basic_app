import 'dart:io';

import 'package:flutter/material.dart';
class ExpandedWidgetExample extends StatelessWidget {
  const ExpandedWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                color: Colors.amber,
                child: Text('CardOne without flex'),
              )
          ),
          const SizedBox(height: 20,),
          Expanded(
            flex: 1,
              child: Container(
                color: Colors.green,
                child: const Text('CardTwo with flex'),
              )
          ),
          const SizedBox(height: 20,),
          Expanded(
            flex: 2,
              child: Container(
                color: Colors.red,
                child: const Text('CardThree with flex'),
              )
          ),
          const SizedBox(height: 20,),
          Expanded(
            flex: 7,
              child: Container(
                color: Colors.blue,
                child: const Text('CardFour with flex'),
              )
          )
        ],
      ),
    );
  }
}
