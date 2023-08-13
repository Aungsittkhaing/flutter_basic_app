import 'package:flutter/material.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';
class PreviewPage extends StatelessWidget {
  String title;
  Widget previewWidget;
  String filePath;
  PreviewPage({super.key, required this.title, required this.previewWidget, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: WidgetWithCodeView(
        filePath: filePath,
        child: previewWidget,
      ),
    );
  }
}
