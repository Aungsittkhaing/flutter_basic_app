import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
const _pages = <String, IconData>{
  "home" : Icons.home,
  "map" : Icons.map,
  "add" : Icons.add,
  "message" : Icons.message,
  "people" : Icons.people
};
class ConvexAppbarExample extends StatelessWidget {
  const ConvexAppbarExample({super.key});

  @override
  Widget build(BuildContext context) {
    TabStyle _tabStyle = TabStyle.flip;
    return DefaultTabController(
        length: 5, 
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                  child: TabBarView(
                    children: [
                      for(final icon in _pages.values)
                        Icon(icon)
                    ],
                  ) 
              )
            ],
          ),
          bottomNavigationBar: ConvexAppBar.badge(
              const <int, dynamic>{3 : '99+'},
              style: _tabStyle,
              items: <TabItem>[
                for(final entry in _pages.entries)
                TabItem(icon: entry.value, title: entry.key)   
              ],
            onTap: (int i)=> Fluttertoast.showToast(msg: i.toString()),
          ),
        )
    );
  }
}
