import 'package:flutter/material.dart';

import '../widger/buildButton.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String _output = '0';
  String _input ='0';
  String _ope ='0';
  double num1 = 0;
  double num2 = 0;

  void buttonPress(String value){
    print(value);
    setState(() {
      if(value == 'C'){
        _output ='0';
        _input ='0';
        _ope ='';
        num1 = 0;
        num2 = 0;
      }else if(value == '='){
        num2 =double.parse(_input);
        if(_ope == '+'){
          _output = (num1+num2).toString();
        }else if(_ope == '-'){
          _output = (num1-num2).toString();
        }else if(_ope == '*'){
          _output = (num1*num2).toString();
        }else if(_ope == '/'){
          _output = (num2 !=0) ? (num1/num2).toString():'Error';
        }
        _input =_output;
      }else if(['+','-','*','/'].contains(value)){
        num1 = double.parse(_input);
        _ope = value;
        _input ='';
      }else{
        if(_input == '0'){
          _input = value;
        }else{
          _input += value;
        }
        _output = _input;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator App'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(22),
              child: Text(_output,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,


                ),
              ),
            ),
          ),

          Row(
            children: [
              buildButton(onclick:()=> buttonPress('7'), text: '7', color: null,),
              buildButton(onclick: ()=> buttonPress('8'), text: '8', color: null,),
              buildButton(onclick: ()=> buttonPress('9'), text: '9', color: null,),
              buildButton(onclick: ()=> buttonPress('/'), text: '/', color: Colors.orange,),

            ],
          ),
          Row(
            children: [
              buildButton(onclick: ()=> buttonPress('4'), text: '4', color: null,),
              buildButton(onclick: ()=> buttonPress('5'), text: '5', color: null,),
              buildButton(onclick: ()=> buttonPress('6'), text: '6', color: null,),
              buildButton(onclick: ()=> buttonPress('*'), text: '*', color: Colors.orange,),
            ],
          ),
          Row(
            children: [
              buildButton(onclick: ()=> buttonPress('1'), text: '1', color: null,),
              buildButton(onclick: ()=> buttonPress('2'), text: '2', color: null,),
              buildButton(onclick: ()=> buttonPress('3'), text: '3', color: null,),
              buildButton(onclick: ()=> buttonPress('-'), text: '-', color: Colors.orange,),
            ],
          ),
          Row(
            children: [
              buildButton(onclick: ()=> buttonPress('C'), text: 'C', color: Colors.red,),
              buildButton(onclick: ()=> buttonPress('0'), text: '0', color: null,),
              buildButton(onclick: ()=> buttonPress('='), text: '=', color: Colors.green,),
              buildButton(onclick: ()=> buttonPress('+'), text: '+', color: Colors.orange,),
            ],
          ),
        ],
      )



    );
  }
}

