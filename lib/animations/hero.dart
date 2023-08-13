import 'package:flutter/material.dart';
class HeroExample extends StatelessWidget {
  const HeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: GestureDetector(
                onTap: ()=> showSecondPage(context),
                child: const Hero(
                    tag: 'my-hero-animation-tag',
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/imgOne.png'),
                    )
                ),
              ),
              title: const Text('Click on the photo to view the animation transition'),
            ),
          ],
        ),
      ),
    );
  }
  void showSecondPage(BuildContext context){
    Navigator.of(context).push(
     MaterialPageRoute(builder: (ctx) => Scaffold(
       body: Center(
         child: Hero(
           tag: 'My-hero-animation-tag',
           child: Image.asset('assets/images/imgOne.png'),
         ),
       ),
     ),)
    );
  }
}