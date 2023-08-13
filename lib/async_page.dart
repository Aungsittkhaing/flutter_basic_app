import 'package:flutter/material.dart';
import 'package:flutter_app/async/future_builder.dart';
import 'package:flutter_app/async/stream_builder.dart';
import 'package:flutter_app/preview_page.dart';
class AsyncPage extends StatelessWidget {
  const AsyncPage({super.key});

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
        title: const Text('Async', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Future Builder'),
            onTap: (){
              goToPreview('Future Builder', const FutureBuilderExample(), 'lib/async/future_builder.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Stream Builder(Timer App)'),
            subtitle: const Text('update UI according to the last stream value'),
            onTap: (){
              goToPreview('Stream Builder(Timer App)', const StreamBuilderExample(), 'lib/async/stream_builder.dart');
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
