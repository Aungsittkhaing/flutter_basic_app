import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
class AnimationPackageExample extends StatefulWidget {
  const AnimationPackageExample({super.key});

  @override
  State<AnimationPackageExample> createState() => _AnimationPackageExampleState();
}

class _AnimationPackageExampleState extends State<AnimationPackageExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const SizedBox(height: 10.0,),
          const ListTile(
            title: Text('1. OpenContainer'),
            subtitle: Text('A Container that grows to fill the screen to reveal new content when trapped'),
          ),
          OpenContainer(
            transitionDuration: const Duration(milliseconds: 500),
              closedBuilder: (context, action) => const ListTile(
                title: Text('Click me'),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ), 
              openBuilder: (context, action) => const Scaffold(
                body: Center(
                  child: Text('new Page'),
                ),
              ),
          ),
          const Divider(thickness: 2, color: Colors.grey,),
          const ListTile(
            title: Text('2. Page Transition Switcher'),
            subtitle: Text('Transition from the old child similar to animation switcher '),
          ),
          const SizedBox(
            height: 200,
            child: PageTransitionSwitcherExample(),
          ),
          const Divider(thickness: 2, color: Colors.grey,),
          const ListTile(
            title: Text('3. Shared AxisTransition'),
            subtitle: Text('Transition animation between UI elements that have navigational relationship'),
          ),
          const SizedBox(
            height: 200,
            child: ShareAxisExample(),
          ),
          const Divider(thickness: 2, color: Colors.black87,),
          const ListTile(
            title: Text('4. showModel()'),
            subtitle: Text('Displays a dialog with animation'),
          ),
          ElevatedButton(
              onPressed: ()=> showModal(
                  context: context, builder: (ctx) => const AlertDialog(
                title: Text('New Dialog'),
                content: Text('This is Dialog'),
              ),
              ),
              child: const Text('Show Dialog'))
        ],
      ),

    );
  }
}
class PageTransitionSwitcherExample extends StatefulWidget {
  const PageTransitionSwitcherExample({super.key});

  @override
  State<PageTransitionSwitcherExample> createState() => _PageTransitionSwitcherExampleState();
}

class _PageTransitionSwitcherExampleState extends State<PageTransitionSwitcherExample> {
  static const tabs = [
    Icon(Icons.looks_one, size: 48,key: ValueKey(1),),
    Icon(Icons.looks_two, size: 48,key: ValueKey(2),),

  ];
  static const btnNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.message),
        label: 'Message'
    ),
  ];
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
          FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
            child: child,
          ),
          child: tabs[currentTabIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: btnNavBarItems,
        currentIndex: currentTabIndex,
        onTap: (newValue) => setState(() {
          currentTabIndex = newValue;
        }),
      ),
    );
  }
}
class ShareAxisExample extends StatefulWidget {
  const ShareAxisExample({super.key});

  @override
  State<ShareAxisExample> createState() => _ShareAxisExampleState();
}

class _ShareAxisExampleState extends State<ShareAxisExample> {
  final pages = const [
    Icon(Icons.looks_one, size: 64, key: ValueKey(1),),
    Icon(Icons.looks_two, size: 64, key: ValueKey(2),),
    Icon(Icons.looks_3, size: 64, key: ValueKey(3),),
  ];
  int currentTabIndex = 0;
  SharedAxisTransitionType transitionType = SharedAxisTransitionType.scaled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: PageTransitionSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
                  SharedAxisTransition(animation: primaryAnimation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: transitionType,
                    child: child,
                  ),
              child: pages[currentTabIndex],
            )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: currentTabIndex == 0 ? null: ()=> setState(() {
                    currentTabIndex--;
                  })
                      , child: const Text('Back')
                  ),
                  TextButton(onPressed: currentTabIndex == 2 ? null: ()=> setState(() {
                    currentTabIndex++;
                  }), child: const Text('Next'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

