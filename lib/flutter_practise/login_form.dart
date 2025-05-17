import 'package:flutter/material.dart';

class loginformall extends StatelessWidget {
  const loginformall({super.key});

  @override
  Widget build(BuildContext context) {
    final _formvana = GlobalKey<FormState>();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController= TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login form'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      drawer: Drawer(),

      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            // Image.network('https://logolook.net/wp-content/uploads/2021/06/Facebook-Log%D0%BE.png'),
            Image.asset('asset/facebook-76536_1280.png'),
            SizedBox(height: 15),
            Text(
              'Login with your phone number and password',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 20),

            Form(
              key: _formvana,
              child: Column(
                children: [
                  TextFormField(
                    controller:phoneController,

                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.red,
                        size: 30,
                      ),
                      labelText: 'phone number',
                      labelStyle: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 25,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20,),


                  TextFormField(
                    controller:passwordController ,
               decoration: InputDecoration(
                hintText: 'password',
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.red,
                  size: 30,
                ),
                labelText: ' Password',
                labelStyle: TextStyle(color: Colors.blue, fontSize: 25),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length <= 6) {
                  return 'Password at least 6 character';
                } else {
                  return null;
                }
              },
             ),
                ],
             ),


            ),




              ElevatedButton(
              onPressed: () {
                if (_formvana.currentState!.validate()) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Login Successful')));
                }
              },
              child: Text('Submit'),
             ),




      ],

    )
    )
    );
  }
}
