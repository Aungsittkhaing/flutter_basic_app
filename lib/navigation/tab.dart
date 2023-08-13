import 'package:flutter/material.dart';
class TabExample extends StatelessWidget {
  const TabExample({super.key});

  @override
  Widget build(BuildContext context) {
    final _tabpages = <Widget>[
      const Center(
        child: Icon(
          Icons.phone,
          size: 64,
          color: Colors.teal,
        ),
      ),
      const Center(
        child: Icon(
          Icons.alarm,
          size: 64,
          color: Colors.blue,
        ),
      ),
      const Center(
        child: Icon(
          Icons.message,
          size: 64,
          color: Colors.cyan,
        ),
      )
    ];

    final _tabs = <Tab>[
      const Tab(icon: Icon(Icons.phone),text: 'Phone',),
      const Tab(icon: Icon(Icons.alarm),text: 'Alarm',),
      const Tab(icon: Icon(Icons.message),text: 'Message',),
    ];
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tab Example'),
            backgroundColor: Colors.cyan,
            bottom: TabBar(
              tabs: _tabs,
            ),
          ),
          body: TabBarView(
            children: _tabpages,
          ),
        )
    );
  }
}
