import 'package:flutter/material.dart';
class Entry{
  final String title;
  final List<Entry> children;
  const Entry(this.title, [this.children = const<Entry>[]]);
}
//data entry
const List<Entry> data = [
  Entry(
      'ChapterA',
      <Entry>[
        Entry(
            'Section A0',
            <Entry>[
              Entry('Item A0.1'),
              Entry('Item A0.2')
            ]
        ),
        Entry('Section A1'),
        Entry('Section A2')
      ]
  ),
  Entry(
      'EntryB',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1')
    ]
  )
];
class ExpansionTileExample extends StatelessWidget {

  const ExpansionTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: data.length,
          itemBuilder: (context, index) {
            return EntryItem(data[index]);
          },
      ),
    );
  }
}
class EntryItem extends StatelessWidget {
  final Entry entry;
  const EntryItem(this.entry);

  Widget _builderTiles(Entry root){
    if(root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
  key: PageStorageKey<Entry>(root),
  title: Text(root.title),
  children: root.children.map(_builderTiles).toList(),
  );
  }

  @override
  Widget build(BuildContext context) {
    return _builderTiles(entry);
  }
}

