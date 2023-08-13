import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
class ListTileExample extends StatelessWidget {
  const ListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Title0: Basic'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.face),
            title: Text('list tile with leading and trailing'),
            trailing: Icon(Icons.face_2),
          ),
          Divider(),
          ListTile(
            title: Text('ListTile Two'),
            subtitle: Text('subtitle with listtile'),
          ),
          Divider(),
           ListTile(
            title: Text('ListTile Three with is three line'),
            isThreeLine: true,
             subtitle: Text('subtitle of title 3'),
          ),
          Divider(),
          ListTile(
            title: Text('ListTile Four with dense'),
            dense: true,
            subtitle: Text('subtitle of title 4'),
          ),
          Divider(),
          ListTile(
            title: Text('ListTile Five with badge'),
            subtitle: Text('subtitle with badge package'),
            trailing: badges.Badge(
              badgeContent: Text('3'),
              badgeStyle: badges.BadgeStyle(badgeColor: Colors.blue),
              child: Icon(Icons.notifications),
            ),
          )
        ],
      ),
    );
  }
}
