import 'package:flutter/material.dart';
class NavigationDrawerExample extends StatelessWidget {
  const NavigationDrawerExample({super.key});

  @override
  Widget build(BuildContext context) {
    //drawer header widget
    const drawerHeader = UserAccountsDrawerHeader(
        accountName: Text('Aung Sitt Khaing'),
        accountEmail: Text('ask@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: FlutterLogo(size: 42.0),
      ),
      otherAccountsPictures: [
        CircleAvatar(
          backgroundColor: Colors.yellow,
          child: Icon(Icons.settings),
        ),
        CircleAvatar(
          backgroundColor: Colors.red,
          child: Icon(Icons.help_center),
        ),
      ],
    );
    //drawer items
    final drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: const Text('Home'),
          onTap: () => Navigator.of(context).push(_newPages('Home')),
        ),
        ListTile(
          title: const Text('About'),
          onTap: () => Navigator.of(context).push(_newPages('About')),
        ),
        ListTile(
          title: const Text('Contact'),
          onTap: () => Navigator.of(context).push(_newPages('Contact')),
        ),
        ListTile(
          title: const Text('Other Drawer Items'),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () => Navigator.of(context).pop(),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Example'),
        backgroundColor: Colors.lightBlue,
      ),
      body: const Center(
          child: Text('Swipe or click upper-left icon to see drawer')
      ),
      drawer: Drawer(
        child: drawerItems,
      ),
    );
  }
}
class _newPages extends MaterialPageRoute<void>{
  _newPages(String name): super(
    builder: (BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('Page $name'),
          elevation: 1.0,
        ),
        body: Center(
          child: Text('Page $name'),
        ),
      );
    }
  );

}
