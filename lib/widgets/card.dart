import 'package:flutter/material.dart';
class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    double sideLength = 50.0;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const Card (
            color: Colors.red,
            elevation: 10.0,
            child: SizedBox(
              height: 100.0,
              child: Row(
                children:  [
                   Expanded(
                       child: Text('Card Example 1')
                   )
                ],
              ),
            ),
          ),
           Card(
            color: Colors.lightBlue,
            elevation: 10.0,
            child: SizedBox(
              width: sideLength,
              height: sideLength,
              child: InkWell(
                splashColor: Colors.blue,
                onTap: (){
                  sideLength == 50 ? sideLength = 100: sideLength = 50;
                },
                child: const Row(
                  children: [
                    Expanded(child: Text('This is card 2 with inkwell'))
                  ],
                ),
              ),
            ),
          ),
          const Card(
            color: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.elliptical(40, 80)
              )
            ),
            child: SizedBox(
              height: 150,
              child: Row(
                children: [
                  Text('Card 3 Example with border radius')
                ],
              ),
            ),
          ),
          Card(
            color: Colors.cyanAccent,
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset('images/imgOne.png', fit: BoxFit.cover),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 16,
                        right: 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text('Card 4 (Complex Example)',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){}, child: const Text('Share')),
                    TextButton(onPressed: (){}, child: const Text('Explore'))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
