import 'package:flutter/material.dart';
import 'package:flutter_app/appbar_page.dart';
import 'package:flutter_app/async_page.dart';
import 'package:flutter_app/layouts.dart';
import 'package:flutter_app/list_page.dart';
import 'package:flutter_app/navigation_page.dart';
import 'package:flutter_app/widget_page.dart';

import 'animation_page.dart';
class HomeExample extends StatelessWidget {
  const HomeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Widgets'),
            onTap: (){
              //Navigate to Widget page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext ctx) => const WidgetPage(),
                  )
              );
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('LayOut'),
            onTap: (){
              //Navigate to layout
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext ctx) => const LayoutPage(),
                  )
              );
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lists'),
            onTap: (){
              //Navigate to list
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListPage(),
                  )
              );
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.desktop_windows),
            title: const Text('Appbar'),
            onTap: (){
              //Navigate to appbar
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AppBarPage(),
                  )
              );
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.desktop_mac),
            title: const Text('Screen Share'),
            onTap: (){
              //Navigate to navigation
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationPage(),
                  )
              );
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Async'),
            onTap: (){
              //navigation to async
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AsyncPage(),
                  )
              );
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.animation),
            title: const Text('Animation (basic)'),
            onTap: (){
              //Navigate to animation
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnimationPage(),
                  )
              );
            },
          ),
        ],
      ),
    );
  }
}
