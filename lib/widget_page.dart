import 'package:flutter/material.dart';
import 'package:flutter_app/preview_page.dart';
import 'package:flutter_app/widgets/button.dart';
import 'package:flutter_app/widgets/card.dart';
import 'package:flutter_app/widgets/dropdown_button.dart';
import 'package:flutter_app/widgets/gradient.dart';
import 'package:flutter_app/widgets/icon.dart';
import 'package:flutter_app/widgets/image.dart';
import 'package:flutter_app/widgets/stateful_widget.dart';
import 'package:flutter_app/widgets/text.dart';
import 'package:flutter_app/widgets/textfield.dart';
class WidgetPage extends StatelessWidget {
  const WidgetPage({super.key});

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
        title: const Text('Widgets', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          ListTile(
            leading: const Icon(Icons.favorite_outline),
            title: const Text('Icon'),
            onTap: (){
              //navigate to icon
              goToPreview('Icons', const IconWidget(), "lib/widgets/icon.dart");
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: const Text('Text'),
            onTap: (){
              goToPreview('Text', const TextWidget(), "lib/widgets/text.dart");

            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text('TextField'),
            subtitle: const Text('Text Input'),
            onTap: (){
              goToPreview('TextField', const TextFieldWidget(), 'lib/widgets/textfield.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text('TextFormField'),
            subtitle: const Text('Convenience widget wrapping a TextField in a FormField'),
            onTap: (){

            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.image_outlined),
            title: const Text('Images'),
            onTap: (){
              goToPreview('Images', const ImageWidget(), 'lib/widgets/image.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.card_membership_outlined),
            title: const Text('Card, Inkwell'),
            subtitle: const Text('Container with corner and shadow; Inkwell effect'),
            onTap: (){
              goToPreview('Card', const CardExample(), 'lib/widgets/card.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.token_outlined),
            title: const Text('Gradient and BoxDecoration for better UI'),
            subtitle: const Text('Container with corner and shadow; Inkwell effect'),
            onTap: (){
              goToPreview('Gradient', const GradientExample(), 'lib/widgets/gradient.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.radio_button_checked_outlined),
            title: const Text('Buttons'),
            subtitle: const Text('Elevated Buttons, TextButtons, Outline Buttons, IconsButtons & Tooltips'),
            onTap: (){
              goToPreview('Buttons', const ButtonExample(), 'lib/widgets/button.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.arrow_drop_down_circle),
            title: const Text('DropDown, Buttons Menu Buttons'),
            onTap: (){
              goToPreview('DropDown', const DropDownButtonExample(), 'lib/widgets/dropdown_button.dart');
            },
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.open_with_rounded),
            title: const Text('Other Stateful widgets'),
            subtitle: const Text('Switch, CheckBox, Slider, etc'),
            onTap: (){
              goToPreview('Other Stateful Widgets', const StatefulWidgetExample(), 'lib/widgets/stateful_widget.dart');
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