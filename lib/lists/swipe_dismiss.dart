import 'package:flutter/material.dart';
class SwipeDismissExample extends StatefulWidget {
  const SwipeDismissExample({super.key});

  @override
  State<SwipeDismissExample> createState() => _SwipeDismissExampleState();
}

class _SwipeDismissExampleState extends State<SwipeDismissExample> {
  final _items = List<String>.generate(20, (index) => 'Item $index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightGreenAccent,),
      body: ListView.builder(
        itemCount: _items.length,
          itemBuilder: (context, index){
            final String currentItem = _items[index];
            return Dismissible(
                key: Key(currentItem),
                onDismissed: (direction) {
                  setState(() {
                    _items.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                      direction == DismissDirection.startToEnd ? "$currentItem removed": "$currentItem liked"
                    ),
                      action: SnackBarAction(
                        label: "UNDO",
                        onPressed: (){
                          setState(() {
                            _items.insert(index, currentItem);
                          });
                        },
                      ),
                    )
                  );
                },
                background: Container(
                  color: Colors.redAccent,
                  alignment: Alignment.centerLeft,
                  child: const Icon(Icons.delete),
                ),
                secondaryBackground: Container(
                  color: Colors.lightGreenAccent,
                  alignment: Alignment.centerRight,
                  child: const Icon(Icons.thumb_up),
                ),
                child: ListTile(
                  title: Center(
                    child: Text(currentItem),
                  ),
                ));
          }),
    );
  }
}
