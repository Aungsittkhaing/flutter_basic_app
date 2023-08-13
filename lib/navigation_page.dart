import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/bottom_navbar.dart';
import 'package:flutter_app/navigation/bottom_sheet.dart';
import 'package:flutter_app/navigation/bottom_tab_bar.dart';
import 'package:flutter_app/navigation/dialogs.dart';
import 'package:flutter_app/navigation/draggable_scrollable_sheet.dart';
import 'package:flutter_app/navigation/navigation_drawer.dart';
import 'package:flutter_app/navigation/page_selector.dart';
import 'package:flutter_app/navigation/routes.dart';
import 'package:flutter_app/navigation/tab.dart';
import 'package:flutter_app/preview_page.dart';
class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

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
        title: const Text('Navigation', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          ListTile(
            leading: const Icon(Icons.navigation),
            title: const Text('Tabs'),
            onTap: (){
              goToPreview('Tab', const TabExample(), 'lib/navigation/tab.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.navigation),
            title: const Text('Dialogs'),
            onTap: (){
              goToPreview('Dialogs', const DialogExample(), 'lib/navigation/dialogs.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.navigation),
            title: const Text('Routes'),
            subtitle: const Text('Jumping between pages'),
            onTap: (){
              goToPreview('Routes', const RoutesExample(), 'lib/navigation/routes.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.navigation),
            title: const Text('Navigation Drawer'),
            onTap: (){
              goToPreview('Navigation Drawer', const NavigationDrawerExample(), 'lib/navigation/navigation_drawer.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.navigation),
            title: const Text('Bottom Sheet'),
            onTap: (){
              goToPreview('Bottom Sheet', const BottomSheetExample(), 'lib/navigation/bottom_sheet.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.navigation),
            title: const Text('Bottom Tab Bar'),
            onTap: (){
              goToPreview('Bottom Tab Bar', const BottomTabBarExample(), 'lib/navigation/bottom_tab_bar.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.navigation),
            title: const Text('Bottom Navigation Bar'),
            onTap: (){
              goToPreview('Bottom Navigation Bar', const BottomNavBarExample(), 'lib/navigation/bottom_navbar.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.navigation),
            title: const Text('Page Selector'),
            onTap: (){
              goToPreview('Page Selector', const PageSelectorExample(), 'lib/navigation/page_selector.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.navigation),
            title: const Text('Draggable Scrollable Sheet'),
            onTap: (){
              goToPreview('Draggable Scrollable Sheet', const DraggableScrollableExample(), 'lib/navigation/draggable_scrollable_sheet.dart');
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