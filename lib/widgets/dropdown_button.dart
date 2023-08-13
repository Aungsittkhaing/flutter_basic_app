import 'package:flutter/material.dart';
class DropDownButtonExample extends StatefulWidget {
  const DropDownButtonExample({super.key});

  @override
  State<DropDownButtonExample> createState() => _DropDownButtonExampleState();
}

class _DropDownButtonExampleState extends State<DropDownButtonExample> {
  static const menuItems = <String>[
    "One","Two","Three","Four"
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems.map(
          (String value) => DropdownMenuItem(
              value: value,
              child: Text(value))).toList();

  final List<PopupMenuItem<String>> _popupMenuItems = menuItems.map(
          (String value) => PopupMenuItem(
              value: value,
              child: Text(value))).toList();
  String _btnOneSelectedVal = "One";
  String? _btnTwoSelectedVal;
  late String _btnThreeSelectedVal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('DropDown Buttons', style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('DropDownButton with default:'),
            trailing: DropdownButton<String>(
              value: _btnOneSelectedVal,
              onChanged: (String? newValue){
                if(newValue != null){
                  setState(() {
                    _btnOneSelectedVal = newValue;
                  });
                }
              },
              items: _dropDownMenuItems,
            ),
          ),
          ListTile(
            title: const Text('DropDownButton with hints'),
            trailing: DropdownButton<String>(
              value: _btnTwoSelectedVal,
              hint: const Text('Choose'),
              onChanged: (String? newValue){
                if(newValue != null){
                  setState(() {
                    _btnTwoSelectedVal = newValue;
                  });
                }
              },
              items: _dropDownMenuItems,
            ),
          ),
          ListTile(
            title: const Text('PopUp Menu Button:'),
            trailing: PopupMenuButton<String>(
              onSelected: (String newValue){
                _btnThreeSelectedVal = newValue;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_btnThreeSelectedVal)));
              },
              itemBuilder: (BuildContext context)=> _popupMenuItems,
            ),
          )
        ],
      ),
    );
  }
}
