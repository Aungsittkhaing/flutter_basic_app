import 'package:flutter/material.dart';
import 'package:flutter_app/lists/expanded_tile.dart';
import 'package:flutter_app/lists/list_tile.dart';
import 'package:flutter_app/lists/listview_builder.dart';
import 'package:flutter_app/lists/reorderable_list.dart';
import 'package:flutter_app/lists/slidable_tile.dart';
import 'package:flutter_app/lists/swipe_dismiss.dart';
import 'package:flutter_app/preview_page.dart';

import 'lists/grid_list.dart';
class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    void goToPreview(String title, Widget previewWidget, String filePath){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext ctx) => PreviewPage(
              title: title,
              filePath: filePath,
              previewWidget: previewWidget,
            ),
          )
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          ListTile(
            leading: const Icon(Icons.list_outlined),
            title: const Text('ListTile'),
            onTap: (){
              goToPreview('List Tile', const ListTileExample(), 'lib/lists/list_tile.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.list_outlined),
            title: const Text('ListView Builder'),
            subtitle: const Text('Building list item with builder'),
            onTap: (){
              goToPreview('ListView Builder', const ListViewBuilderExample(), 'lib/lists/listview_builder.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.list_outlined),
            title: const Text('GridList'),
            onTap: (){
              goToPreview('GridList', const GirdListExample(), 'lib/lists/grid_list.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.list_outlined),
            title: const Text('ExpansionTile'),
            onTap: (){
              goToPreview('ExpansionTile', const ExpansionTileExample(), 'lib/lists/expanded_tile.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.list_outlined),
            title: const Text('SwipeToDismiss'),
            onTap: (){
              goToPreview('SwipeToDismiss', const SwipeDismissExample(), 'lib/lists/swipe_dismiss.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.list_outlined),
            title: const Text('Reorderable List'),
            onTap: (){
              goToPreview('Reorderable List', const ReorderableExample(), 'lib/lists/reorderable_list.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.list_outlined),
            title: const Text('List Wheel Scroll View'),
            subtitle: const Text('fancy list view'),
            onTap: (){

            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.list_outlined),
            title: const Text('Slidable ListTile'),
            subtitle: const Text('Nice slidable tile from flutter favourite package'),
            onTap: (){
              goToPreview('Slidable ListTile', const SlidableTileExample(), 'lib/lists/slidable_tile.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
        ],
      ),
    );
  }
}
