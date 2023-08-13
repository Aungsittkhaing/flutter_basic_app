import 'package:flutter/material.dart';
class BasicAppBarExample extends StatelessWidget {
  const BasicAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text('AppBar Testing', style: TextStyle(color: Colors.teal),),
        leading: const Icon(Icons.face_2_outlined),
        actions: [
          IconButton(onPressed: (){},
              icon: const Icon(Icons.directions_bike_outlined)
          ),
          IconButton(onPressed: (){},
              icon: const Icon(Icons.directions_bus_filled_outlined)
          ),
          PopupMenuButton(
              itemBuilder: (context) {
               return [
                 PopupMenuItem(child: Text('Boat')),
                 PopupMenuItem(child: Text('Plane'))
               ];
              })
        ],
      ),
      body: Center(
        child: const Text('Hello World'),
      ),
    );
  }
}
