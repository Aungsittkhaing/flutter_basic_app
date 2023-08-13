import 'package:flutter/material.dart';
class SilverAppBarExample extends StatelessWidget {
  const SilverAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.amber,
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: 160.0,

            flexibleSpace: FlexibleSpaceBar(
              title: const Text('FlexibleSpace Title'),
              background: Image.asset('assets/images/codeThree.jpeg', fit: BoxFit.fill,),
            ),
          ),
          const SliverFillRemaining(
            child: Center(child: Text('Hello World')),
          )
        ],
      ),

    );
  }
}
