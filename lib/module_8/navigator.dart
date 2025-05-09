import 'package:flutter/material.dart';

import '../flutter_practise/flutter_prcs_2.dart';
import 'listview.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:' login text',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  // final String name;
  const Home({super.key,});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final _formKey = GlobalKey<FormState>();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
        backgroundColor:Colors.blue,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Center(
          child:  Column(
            children: [
              // Text('name'),

              SizedBox(
                height: 10,
              ),
              Image.asset(
                "asset/facebook-76536_1280.png",
                fit: BoxFit.fill,
              ),
              // Image.network("image er link"),
              SizedBox(
                height: 45,
              ),
        
              Text('Login with your phone and password'),
              SizedBox(
                height: 20,
              ),
        
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Phone Number'),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
        
                        validator: (value){
                          if(value == null ||value.isEmpty){
                            return 'Please enter your phone number';
                          }else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Password'),
        
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
        
                        validator: (value){
                          if(value == null ||value.isEmpty){
                            return 'Please enter your password';
                          }else if(value.length <=6){
                            return 'Password must be at least 6 characters';
                          }else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(onPressed: (){
                          if(_formKey.currentState!.validate()){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login Successful')),
                            );
                          }
        
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> Homer()));
        
                        }, child:Text('Login',style: TextStyle(
                          backgroundColor: Colors.blue,
                          color: Colors.white,
        
                        ),) ),
                      ),
                      ElevatedButton(onPressed: (){
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context)=> Lister()));
                      }, child: Text('List')),
                    ],
                  ))
            ],
          ),
        ),
      ),

    );
  }
}



