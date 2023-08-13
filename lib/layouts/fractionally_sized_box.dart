import 'package:flutter/material.dart';
class FractionallySizedBoxExample extends StatelessWidget {
  const FractionallySizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amberAccent,),
      body: const Column(
        children: [
          SizedBox(height: 20,),
          Text('Fractonally Sized box sizes its child to a fraction of the available space'),
          Text('FractionallySizedBox with no child serves as whitespace,'
              'The whitespace below always takes 10% of the available space'
          ),
          Flexible(
              child: FractionallySizedBox(heightFactor: 0.1,)
          ),
          Text('The placeholder below always take 20% of the available height and 50% of the width'),
          Flexible(child: FractionallySizedBox(heightFactor: 0.2,widthFactor: 0.5,child: Placeholder(),))
        ],
      ),
    );
  }
}
