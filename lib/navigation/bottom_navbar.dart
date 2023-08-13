import 'package:flutter/material.dart';
class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({Key? key}) : super(key: key);

  @override
  State<BottomNavBarExample> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavBarExample> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabPages = [
      const Center(child: Icon(Icons.phone,size: 64,color: Colors.purple)),
      const Center(child: Icon(Icons.message,size: 64,color: Colors.cyan)),
      const Center(child: Icon(Icons.facebook,size: 64,color: Colors.blue)),
    ];
    final bottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.phone),label: 'Phone',),
      const BottomNavigationBarItem(icon: Icon(Icons.message),label: 'Message'),
      const BottomNavigationBarItem(icon: Icon(Icons.facebook),label: 'Facebook')

    ];

    final bottomNavBar = BottomNavigationBar(
      items: bottomNavBarItems,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int newIndex){
        setState(() {
          currentIndex = newIndex;
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button NavBar', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple,),
      body: tabPages[currentIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}