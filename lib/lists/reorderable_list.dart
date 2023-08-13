import 'package:flutter/material.dart';
class ReorderableExample extends StatefulWidget {
  const ReorderableExample({super.key});

  @override
  State<ReorderableExample> createState() => _ReorderableExampleState();
}

class _ReorderableExampleState extends State<ReorderableExample> {
  bool _reverseSore = false;
  //list<String> _items = ['A','B','C',...]
  final List<String> _items = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("").toList();

  void _onReorder(int oldIndex, int newIndex){
    print('old index is $oldIndex and new index is $newIndex');
    setState(() {
      final updateIndex = newIndex > oldIndex ? newIndex -1 : newIndex;
      final item = _items.removeAt(oldIndex);
      _items.insert(updateIndex, item);
    });
  }
  void _onSort(){
    setState(() {
      _reverseSore = !_reverseSore;
      _items.sort((a, b) => _reverseSore ? b.compareTo(a) : a.compareTo(b),);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reorderable List'),
        actions: [
          IconButton(onPressed: (){
            _onSort();
          },
              icon: Icon(Icons.sort_by_alpha)
          )
        ],
      ),
    body: ReorderableListView(
      onReorder: _onReorder,
      children: [
        for(final item in _items)
        ListTile(
          key: Key(item),
          title: Text('Item  $item index : ${_items.indexOf(item)}'),
        )
      ],
    ),
    );
  }
}
