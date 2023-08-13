import 'package:flutter/material.dart';
import 'package:flutter_app/animations/animated_container.dart';
import 'package:flutter_app/animations/animated_icons.dart';
import 'package:flutter_app/animations/animation_packages.dart';
import 'package:flutter_app/animations/hero.dart';
import 'package:flutter_app/animations/opacity.dart';
import 'package:flutter_app/preview_page.dart';
class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    void goToPreview(String title, Widget previewWidget, String filePath){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext ctx) => PreviewPage(
              title: title,
              filePath: filePath,
              previewWidget: previewWidget,
            ),
          )
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Hero'),
            subtitle: const Text('Hero Animation between routes'),
            onTap: (){
              goToPreview('Hero', const HeroExample(), 'lib/animations/hero.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Opacity'),
            subtitle: const Text('Making a transparent visible'),
            onTap: (){
              goToPreview('Opacity', const OpacityExample(), 'lib/animations/opacity.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Animated Icon'),
            onTap: (){
              goToPreview('Animated Icon', const AnimatedIconExample(), 'lib/animations/animated_icons.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Animated Container'),
            onTap: (){
              goToPreview('Animated Container', const AnimatedContainerExample(), 'lib/animations/animation_container.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Animation Packages'),
            onTap: (){
              goToPreview('Animation Packages', const AnimationPackageExample(), 'lib/animations/animation_packages.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
        ],
      ),
    );
  }
}