import 'package:flutter/material.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'textfield app',
      home:Home() ,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController =TextEditingController();
    return Scaffold(
      appBar: AppBar(

        title: Text('login page'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),


    body: Column(
      children: [
        SizedBox(
            height: 110,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: TextField(
                controller: phoneController,
                // obscureText: true,
                keyboardType: TextInputType.phone,

                decoration: InputDecoration(
                  // hintText: 'Enter your name',
                  hintText: 'Enter your number',
                  labelText: 'Phone number',
                  labelStyle: TextStyle(
                    fontSize: 23,
                    color: Colors.red,
                  ),
                  prefixIcon: Icon(Icons.phone,color: Colors.blue,),
                  suffixIcon: Icon(Icons.check,color: Colors.blue,),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )


                ),
              ),
            ),
          ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(onPressed: (){
          // print(phoneController.text);
          if(phoneController.text.isEmpty){
            print('Please enter your number');
          }else if(phoneController.text.length <11){
            print('Please enter your correct number');
          }else{
            // phoneController.clear();
            print('Your number is correct:${phoneController.text}');
          }
        }, child: Text('Submit',style: TextStyle(
          color: Colors.white,
          backgroundColor: Colors.blue,
          fontWeight: FontWeight.bold,
        ),)),

        ElevatedButton(onPressed: (){
          phoneController.clear();
        }, child: Text('Clear')),
      ],
    ),

    );

  }
}

