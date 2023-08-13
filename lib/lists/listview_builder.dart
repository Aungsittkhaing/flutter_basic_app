import 'package:flutter/material.dart';
class ListViewBuilderExample extends StatelessWidget {
  const ListViewBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple,),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 20,
          itemBuilder: (context, index){
          int position = index + 1;
            return ListTile(
              leading: CircleAvatar(
                child: Text('$position'),
              ),
              title: Text('Title $position'),
              trailing: const Icon(Icons.dashboard_customize_rounded),
            );
          }),
    );
  }
}
