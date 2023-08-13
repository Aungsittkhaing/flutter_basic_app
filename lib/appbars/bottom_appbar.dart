import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class BottomAppBarExample extends StatelessWidget {
  const BottomAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Bottom AppBar with FAB'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.redAccent,
        child: Row(
          children: [
            IconButton(
                onPressed: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        alignment: Alignment.center,
                        height: 200,
                        child: const Text('This is bottom sheet'),
                      ),
                  );
                },
                icon: const Icon(Icons.menu),
            ),
            IconButton(
                onPressed: (){
                  Fluttertoast.showToast(msg: 'Search Icon Clicked');
            },
                icon: const Icon(Icons.search_outlined)
            ),
            IconButton(onPressed: (){
              Fluttertoast.showToast(msg: 'More Vert Click');
            },
                icon: const Icon(Icons.more_vert_outlined)
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Fluttertoast.showToast(msg: 'Clicked'),
        child: const Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        mini: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
