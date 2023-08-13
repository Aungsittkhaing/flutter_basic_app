import 'package:flutter/material.dart';
class PageSelectorExample extends StatelessWidget {
  const PageSelectorExample({super.key});
  static const icons = [
    Icon(Icons.phone),
    Icon(Icons.message),
    Icon(Icons.browser_updated),
    Icon(Icons.android),
    Icon(Icons.ios_share)

  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: icons.length,
        child:  Builder(
          builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const TabPageSelector(),
                Expanded(child: IconTheme(
                    data: IconThemeData(
                        size: 128.0,
                        color: Theme.of(context).colorScheme.secondary),
                  child: const TabBarView(children: icons),
                )
                ),
                ElevatedButton(onPressed: (){
                  final TabController controller = DefaultTabController.of(context)!;
                  if(!controller.indexIsChanging){
                    controller.animateTo(icons.length - 1);
                  }
                },
                    child: const Text('SKIP'))
              ],
            ),
          ),
        )
    );
  }
}
