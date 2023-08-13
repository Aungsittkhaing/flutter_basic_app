import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class SlidableTileExample extends StatefulWidget {
  const SlidableTileExample({super.key});

  @override
  State<SlidableTileExample> createState() => _SlidableTileExampleState();
}

class _SlidableTileExampleState extends State<SlidableTileExample> {
  //create a data map for action pane
  static final _kActionPaneTypes = <String, Widget>{
    "DrawerMotion" : const DrawerMotion(),
    "BehindMotion" : const BehindMotion(),
    "ScrollMotion" : const ScrollMotion(),
    "StretchMotion" : const StretchMotion()
  };
  late List<Slidable> _items;

  void _showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final mainActions = <Widget>[
      SlidableAction(
        label: 'Archive',
        foregroundColor: Colors.blue,
        icon: Icons.archive,
        onPressed: (_) => _showSnackBar('Archive'),
      ),
      SlidableAction(
        label: 'Share',
        foregroundColor: Colors.indigo,
        icon: Icons.share,
        onPressed: (_) => _showSnackBar('Share'),
      ),
    ];
    final secondaryActions = <Widget>[
      SlidableAction(
        label: 'More',
        foregroundColor: Colors.black26,
        icon: Icons.more_horiz,
        onPressed: (_) => _showSnackBar('More'),
      ),
      SlidableAction(
        label: 'Delete',
        foregroundColor: Colors.yellow,
        icon: Icons.delete,
        onPressed: (_) => _showSnackBar('Delete'),
      )
    ];
    _items = [
      for(final entry in _kActionPaneTypes.entries)
        Slidable(
          key: ValueKey(entry.key),
            startActionPane: ActionPane(
              motion: entry.value,
              extentRatio: 0.2,
              children: mainActions,
            ),
            endActionPane: ActionPane(
              motion: entry.value,
              extentRatio: 0.2,
              children: secondaryActions,
            ),
            child: ListTile(
              leading: const Icon(Icons.swipe),
              title: Text('ListTile with ${entry.key}'),
              subtitle: const Text('Swipe Left and Right to see the actions'),
            )
        )
    ];
    //Dismissible tile example;
    //first create a dismissal obj
    final dismissal = DismissiblePane(
        onDismissed: (){
        _showSnackBar('Dismiss Archive');
        setState(() {
          _items.removeAt(_items.length-1);
        });
    },
      confirmDismiss: () async{
          final bool? result = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Archive'),
                  content: const Text('Confirm action?'),
                  actions: [
                    TextButton(
                        onPressed: ()=> Navigator.of(context).pop(false),
                        child: const Text('Cancel')
                    ),
                    TextButton(onPressed: ()=> Navigator.of(context).pop(true),
                        child: const Text('OK')
                    )

                  ],
                );
              },
          );
          return result ?? false;
      },
    );
    _items.add(
      Slidable(
        key: const Key('dismissibleTile'),
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            dismissible: dismissal,
            children: [mainActions[0]],
          ),
          endActionPane: ActionPane(
            dismissible: dismissal,
            motion: const DrawerMotion(),
            children: [secondaryActions[1]],
          ),
          child: const ListTile(
            leading: Icon(Icons.swap_horiz),
            title: Text('Dismissible Tile'),
            subtitle: Text('Swipe right to archive, swipe left to delete'),
          )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slidable Tile'),),
      body: ListView(
        children: _items,
      ),
    );
  }
}
