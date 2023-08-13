import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    void _showToast() => Fluttertoast.showToast(
        msg: 'Button Tap',
        toastLength: Toast.LENGTH_LONG
    );
    void _showSnack() => ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Show Snack'),
        duration: Duration(microseconds: 1000),
      )
    );
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const Text('Raised Button'),
              ButtonBar(
                children: [
                  ElevatedButton(onPressed: _showSnack, child: const Text('Elevate Button')),
                  const ElevatedButton(onPressed: null, child: Text('Disable'))
                ],
              ),
              const Divider(),
              Column(
                children: [
                  const Text('Flat Button'),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: _showToast, child: const Text('Text Button')),
                      const TextButton(onPressed: null,
                          child: Text('Text Button disable')
                      )
                    ],
                  ),
                ],
              ),
              const Divider(),
              Column(
                children: [
                  const Text('Outline Button'),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(onPressed: (){}, child:  const Text('Outline Button')),
                      const OutlinedButton(onPressed: null, child: Text('Outline Disable'))
                    ],
                  ),
                ],
              ),
              const Divider(),
              Column(
                children: [
                  const Text('Tooltip'),
                  Center(
                    child: IconButton(
                        onPressed: _showSnack,
                        icon: const Icon(Icons.call), iconSize: 32.0,tooltip: 'place a phone call',
                    ),
                  )
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}
