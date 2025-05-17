import 'package:flutter/material.dart';

class textfieldall extends StatelessWidget {
  const textfieldall({super.key});


  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController =TextEditingController();
    // phoneController.clear();
    return Scaffold(
      appBar: AppBar(
        title: Text('Textfield'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: phoneController,
            // obscureText: true,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Enter your number',
              prefixIcon: Icon(Icons.phone,color: Colors.blue,size: 35,),
              suffixIcon: Icon(Icons.remove_red_eye,size: 35,color: Colors.cyan,),
              labelText: 'phone number',labelStyle: TextStyle(
              fontSize: 25,
              color: Colors.red,
            ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),

              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            // print(phoneController.text);
            if(phoneController.text.isEmpty){
              print('Please enter your number');
            }else if(phoneController.text.length <11){
              print('Please enter your correct number');
            }else{
              print('Correct number: ${phoneController.text}');
            }
          }, child: Text(
              style: TextStyle(
               color: Colors.red,
                fontSize: 20,
              ),'Submit')),

          ElevatedButton(onPressed: (){
            phoneController.clear();
            }, child: Text('Clear',style: TextStyle(
            color: Colors.purple,
            fontSize: 25,
          ),)),

          
        ],
      ),
    );
  }
}
