import 'package:flutter/material.dart';
class ListWheelExample extends StatefulWidget {
  const ListWheelExample({super.key});

  @override
  State<ListWheelExample> createState() => _ListWheelExampleState();
}

class _ListWheelExampleState extends State<ListWheelExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('List Wheel View', style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListWheelScrollView.useDelegate(
          itemExtent: 75,
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index){
              if(index < 0 || index > 8){
                return null;
              }
              return ListTile(
                leading: Text('$index', style: const TextStyle(fontSize: 20),),
                title: Text('Title $index'),
                subtitle: const Text('Some Description'),
              );
            }
          )),
    );
  }
}
