import 'package:flutter/material.dart';
import 'package:flutter_app/layouts/container.dart';
import 'package:flutter_app/layouts/fractionally_sized_box.dart';
import 'package:flutter_app/layouts/row_column.dart';
import 'package:flutter_app/layouts/stack.dart';
import 'package:flutter_app/layouts/wrap.dart';
import 'package:flutter_app/preview_page.dart';
class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

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
        title: const Text('Layouts', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Container'),
            subtitle: const Text('Basic widgets for layout'),
            onTap: (){
              goToPreview('Container', const ContainerWidgetExample(), 'lib/layouts/container.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Row & Column'),
            subtitle: const Text('Align children linearly'),
            onTap: (){
              goToPreview('Row & Column', const RowColumnExample(), 'lib/layouts/row_column.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Wraps'),
            subtitle: const Text('Wrap to the next row & column when ran out of room or space'),
            onTap: (){
              goToPreview('Wraps', const WrapExample(), 'lib/layouts/wrap.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Fractionally SizeBoxed'),
            subtitle: const Text('Sizing widgets to a fraction of the total available space'),
            onTap: (){
              goToPreview('Fractionally SizedBoxed', const FractionallySizedBoxExample(), 'lib/layouts/fractionally_sized_box.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Stack'),
            subtitle: const Text('Dividing space by widget(flex)'),
            onTap: (){
              goToPreview('Stack', const StackWidgetExample(), 'lib/layouts/stack.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Wrap'),
            subtitle: const Text('putting widget on top another'),
            onTap: (){
              goToPreview('Wrap', const WrapExample(), 'lib/layouts/wrap.dart');
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

