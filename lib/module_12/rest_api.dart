import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestapiclassIn extends StatefulWidget {
  const RestapiclassIn({super.key});

  @override
  State<RestapiclassIn> createState() => _RestapiclassInState();
}

class _RestapiclassInState extends State<RestapiclassIn> {
  List users = [];
  bool isLoading = false;

  Future<void> fetchUsers() async {
    setState(() {
      isLoading  = true;
    });
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'),
    headers: {
      'Accept' :'application/json'
        }
    );

    setState(() {
      isLoading = false;
    });

    print(response.body);
    // log(response.body);


    if(response.statusCode == 200){
      users = jsonDecode(response.body);
    }else{
      throw Exception('Something worng');
    }
    }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API App'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),

      body: isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
         itemCount: users.length,
          itemBuilder: (context,index){

           final user = users[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(user['name'][0],style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),),
              ),

              // Text(users[index]['name'] avabe likhte pari
              title: Text( user['name'],style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text('UserName: ${user['username']}',style: TextStyle(
                    color: Colors.black,
                  ),),
                  Text('Email: ${user['email']}',style: TextStyle(
                    color: Colors.black,
                  ),),
                  Text('Address: ${user['address']['street']} , ${user['address']['city']}',style: TextStyle(
                    color: Colors.black,
                  ),),
                  Text('Phone: ${user['phone']}',style: TextStyle(
                    color: Colors.black,
                  ),),
                  Text('Website: ${user['website']}',style: TextStyle(
                    color: Colors.black,
                  ),),
                ],
              ),
            );
          }),
    );
  }
}
