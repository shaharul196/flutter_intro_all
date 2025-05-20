import 'package:flutter/material.dart';

class todoin extends StatefulWidget {
  const todoin({super.key});

  @override
  State<todoin> createState() => _todoinState();
}

class _todoinState extends State<todoin> {

  void addtask(){
    if(taskController.text.isNotEmpty){
      setState(() {
        task.add(taskController.text);
        taskController.clear();
      });
      }
    }
    void deletetask(int index){
    setState(() {
     task.removeAt(index) ;
    });
    }

    List<String>task =[];
  TextEditingController taskController =TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo app'),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.8),
        child: Column(
          children: [
            TextField(
              controller: taskController,
             decoration: InputDecoration(
               hintText: 'Enter your task',
               labelText: 'Your task',
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(15),
               )
             ),

             ),

            ElevatedButton(onPressed: addtask, child: Text('Add',)),
            Expanded(
              child: ListView.builder(
                  itemCount: task.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: ListTile(
                        title: Text(task[index]),
                       trailing: IconButton(onPressed:()=>deletetask(index),
                           icon: Icon(Icons.delete)),

                      ),

                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
