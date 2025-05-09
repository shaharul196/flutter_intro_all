import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  void addTask(){
    if(taskController.text.isNotEmpty){
    setState(() {
      task.add(taskController.text);
      taskController.clear();
    });
    }
  }

 void deleteTask(int index){
    setState(() {
      task.removeAt(index);
    });
  }

  List<String> task =[];
  TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: TextField(
                       controller: taskController,
                        decoration: InputDecoration(
                          labelText: 'Enter task',
                          border: OutlineInputBorder(),
                        ),
                      )),
                      SizedBox(width: 15,),
                      ElevatedButton(onPressed: addTask, child: Text('Add',style: TextStyle(
                        color: Colors.orange,
                        backgroundColor: Colors.blue,
                        fontSize: 25,

                      ),)),
                    ],
                  ),

             Expanded(
               child: ListView.builder(
                 // itemCount:10,
                 itemCount: task.length,
                   itemBuilder:(context,index){
                   return Card(
                     child: ListTile(
                       // title:Text('I have a class today'),
                       title: Text(task[index]),
                       trailing: IconButton(onPressed:(){ deleteTask(index);},
                           icon:Icon(Icons.delete,color: Colors.red,) ),

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
