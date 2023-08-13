
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _numberInputIsValid = true;
  Widget _buildNumberTextField(){
    return TextField(
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.headlineMedium,
      decoration: InputDecoration(
          icon: Icon(Icons.attach_money_outlined),
          labelText: 'Enter an integer',
          errorText: _numberInputIsValid ? null : 'please enter an integer',
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))
          )
      ),
      onSubmitted: (val)=> Fluttertoast.showToast(msg: 'You entered: ${int.parse(val)}'),
      onChanged: (String val){
        final v = int.parse(val);
        if(v == null){
          setState(() {
            _numberInputIsValid = false;
          });
        }else{
          setState(() {
            _numberInputIsValid = true;
          });
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const ListTile(title: Text('1. Number Input field'),),
          _buildNumberTextField(),
        ],
      ),
    );
  }
}
