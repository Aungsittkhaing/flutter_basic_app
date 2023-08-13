import 'package:flutter/material.dart';
import 'package:flutter_app/appbars/back_drop.dart';
import 'package:flutter_app/appbars/basic_appbar.dart';
import 'package:flutter_app/appbars/bottom_appbar.dart';
import 'package:flutter_app/appbars/convex_appbar.dart';
import 'package:flutter_app/appbars/hidable_bottom.dart';
import 'package:flutter_app/appbars/search_bar.dart';
import 'package:flutter_app/appbars/silver_appbar.dart';
import 'package:flutter_app/preview_page.dart';
class AppBarPage extends StatelessWidget {
  const AppBarPage({super.key});

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
        title: const Text('AppBar', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          ListTile(
            leading: const Icon(Icons.desktop_windows),
            title: const Text('Basic AppBar'),
            onTap: (){
              goToPreview('Basic AppBar', const BasicAppBarExample(), 'lib/appbars/basic_appbar.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.desktop_windows),
            title: const Text('Bottom AppBar and Floating App Button(FAB)'),
            onTap: (){
              goToPreview('Bottom and Floating Appbar ', const BottomAppBarExample(), 'lib/appbars/bottom_appbar.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.desktop_windows),
            title: const Text('Silver AppBar'),
            subtitle: const Text('AppBar that auto hides'),
            onTap: (){
              goToPreview('Silver AppBar', const SilverAppBarExample(), 'lib/appbars/silver_appbar.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.desktop_windows),
            title: const Text('Search'),
            onTap: (){
              goToPreview('Search', const SearchBarExample(), 'lib/appbars/search_bar.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.desktop_windows),
            title: const Text('BackDrop'),
            subtitle: const Text('Swiping between front and back layer'),
            onTap: (){
              goToPreview('BackDrop', const BackDropExample(), 'lib/appbars/back_drop.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.desktop_windows),
            title: const Text('Convex AppBar'),
            subtitle: const Text('Nicer looking AppBar'),
            onTap: (){
              goToPreview('Convex AppBar', const ConvexAppbarExample(), 'lib/appbars/convex_appbar.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.desktop_windows),
            title: const Text('Hidable Botton Bar'),
            subtitle: const Text('Button Bar auto hide that when scroll down'),
            onTap: (){
              goToPreview('Hidable Bottom Bar', const HidableBottomBarExample(), 'lib/appbars/hidable_bottom.dart');
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