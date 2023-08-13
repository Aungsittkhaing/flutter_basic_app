import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
class BackDropExample extends StatelessWidget {
  const BackDropExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('BackDrop Testing'),
      ),
        headerHeight: 100.0,
        backLayer: const Center(
            child: Text('Back Layer',style: TextStyle(fontSize: 20.0),),
        ),
        frontLayer: const Center(
            child: Text('Front Layer', style: TextStyle(fontSize: 20.0),)
        )
    );
  }
}
