import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/flutter_practise/practise_all.dart';
import '../flutter_practise/flutter_prcs_2.dart';
import '../module_9/aspect_ratio.dart';
import '../module_9/drawer.dart';


class navigationall extends StatefulWidget {

  const navigationall({super.key});

  @override
  State<navigationall> createState() => _navigationallState();
}

class _navigationallState extends State<navigationall> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController phoneController =TextEditingController();
    TextEditingController passwordController =TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation app'),
        backgroundColor: Colors.blue ,
        centerTitle: true,
      ),

      body: Column(
        children: [

         Form(
           key: formKey,
             child:
          Column(
          children: [
            SizedBox(height: 20,),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                labelText: 'phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )

              ),
              validator: (value){
                if(value == null ||value.isEmpty){
                  return 'Enter your number';
                }else{
                  return null;
                }
              }
            ),


            SizedBox(height: 20,),

            TextFormField(
              controller: passwordController,
             decoration: InputDecoration(
               hintText: 'Password',
               labelText: 'Your password',
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(20),
                 )
             ),
              validator: (value){
                if(value ==null||value.isEmpty){
                  return 'Enter your correct number';
                }else if(value.length<=6){
                  return 'At least 6 character';
                }else{
                  return null;
                }
              }
            ),
          ],
         ) ),

          ElevatedButton(onPressed: (){
          if(formKey.currentState!.validate()){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login Successfull')),
            );
          }
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>Aspectall()));

          }, child: Text('Login')),


        ],
      ),

    );
  }
}
