import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
class StatefulWidgetExample extends StatefulWidget {
  const StatefulWidgetExample({super.key});

  @override
  State<StatefulWidgetExample> createState() => _StatefulWidgetExampleState();
}

class _StatefulWidgetExampleState extends State<StatefulWidgetExample> {
  bool _switchVal = true;
  bool _checkBoxVal = true;
  double _sliderValOne = 0.5;
  double _sliderValTwo = 0;
  int _radioVal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('DropDown Buttons', style: TextStyle(color: Colors.white),),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Text('Switch'),
          Center(
            child: Switch(
              value: _switchVal,
              onChanged: (bool newValue){
                setState(() {
                  _switchVal = newValue;
                });
              },
            ),
          ),
          const Text('Disable Switch'),
          const Center(
            child: Switch(
              value: false,
              onChanged: null,
            ),
          ),
          const Divider(),
          const Text('Checkbox'),
          Checkbox(
              value: _checkBoxVal,
              onChanged: (bool? newVal){
                if(newVal != null){
                  setState(() {
                    _checkBoxVal = newVal;
                  });
                }
              }),
          const Text('Disable Checkbox'),
          const Checkbox(
              value: false,
              onChanged: null
          ),
          const Divider(),
          const Text('Slider'),
          Slider(
              value: _sliderValOne,
              onChanged: (double newVal){
                setState(() {
                  _sliderValOne = newVal;
                });
              }
          ),
          const Text('Slider with divisions and label'),
          Slider(value: _sliderValTwo,
              max: 100.0,
              divisions: 5,
              label: "${_sliderValTwo.round()}",
              onChanged: (double newVal){
            setState(() {
              _sliderValTwo = newVal;
            });
              }),
          const Divider(),
          const Text('Linear Progress Indicator'),
          const LinearProgressIndicator(),
          const Divider(),
          const Text('Circular Progress Indicator'),
          const Center(child: CircularProgressIndicator(),),
          const Divider(),
          const Text('Radio'),
          Row(
            children: [0,1,2,3].map(
                    (int index) => Radio(
                        value: index,
                        groupValue: _radioVal,
                        onChanged: (int? newVal){
                          if(newVal != null){
                            setState(() {
                              _radioVal = newVal;
                            });
                          }

            })).toList(),
          )
        ],
      ),
    );
  }
}
