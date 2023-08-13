import 'package:flutter/material.dart';
class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({super.key});

  @override
  State<BottomSheetExample> createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  //Global key needs to show bottom sheet
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Container buildButtonSheet(BuildContext context){
      return Container(
        height: 700,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: ListView(
          children: [
            ListTile(title: Text('Bottom Sheet'),),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.attach_money_outlined),
                labelText: 'Enter an integer'
              ),
            ),
            const SizedBox(height: 20.0,),
           Container(
             alignment: Alignment.center,
             child: ElevatedButton.icon(
                 onPressed: (){
                   Navigator.of(context).pop();
                 },
                 icon: const Icon(Icons.save),
                 label: const Text('Save & Close')
             ),
           )
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Sheet'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              _scaffoldKey.currentState?.showBottomSheet((context){
                return buildButtonSheet(context);
              });
            },
                child: const Text('Show Bottom Sheet')
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              showModalBottomSheet(
                  context: context,
                  builder: (ctx) => buildButtonSheet(ctx));
            },
                child: const Text('show modal bottom sheet'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Text('Add'),
      ),
    );
  }
}

