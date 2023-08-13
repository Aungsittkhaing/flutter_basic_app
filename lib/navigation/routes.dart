import 'package:flutter/material.dart';
class RoutesExample extends StatelessWidget {
  static const routeName = "/RoutesExample";
  const RoutesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, _pageTwo());
            },
            child: const Text('Go to page2')
        ),
      ),
    );
  }
}
class _pageTwo extends MaterialPageRoute<void>{
  _pageTwo():super(
    builder: (BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Page2'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Go to page3'),
            onPressed: (){
              //Navigator.push<T> return a Future<T>,
              //return value of the pushed route when it's popped.
              Navigator.push(context, _pageThree()).then(
                      (retunVal) {
                        if(retunVal != null){
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('You clicked: $retunVal'),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: (){},
                              ),
                            )
                          );
                        }
              });
            },
          ),
        ),
      );
    }
  );
}
class _pageThree extends MaterialPageRoute<String>{
  _pageThree():super(
      builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Last Page'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(32.0),
            child: ListView(
              children: [
                ListTile(
                  leading: const CircleAvatar(child: Text('1'),),
                  title: const Text('ask@gmail.com'),
                  onTap: ()=>Navigator.pop(context, 'ask@gmail.com'),
                ),
                ListTile(
                  leading: const CircleAvatar(child: Text('2'),),
                  title: const Text('kmh@gmail.com'),
                  onTap: ()=>Navigator.pop(context, 'kmh@gmail.com'),
                ),
                ListTile(
                  leading: const CircleAvatar(child: Text('3'),),
                  title: const Text('hhn@gmail.com'),
                  onTap: ()=>Navigator.pop(context, 'hhn@gmail.com'),
                ),
                const Divider(),
                MaterialButton(
                  child: const Text('Go Home'),
                    onPressed: (){
                  Navigator.popUntil(context, ModalRoute.withName(RoutesExample.routeName));
                })
              ],
            ),
          ),
        );
      }
  );
}
