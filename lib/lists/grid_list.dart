import 'package:flutter/material.dart';
class GirdListExample extends StatelessWidget {
  const GirdListExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple,),
      body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(20, (index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 3.0)
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text("Item: $index", style: Theme.of(context).textTheme.headlineMedium,),
              );
            }),
      ),
    );
  }
}
