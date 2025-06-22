import 'package:flutter/material.dart';

class FcnTodoapp extends StatefulWidget {
  const FcnTodoapp({super.key});

  @override
  State<FcnTodoapp> createState() => _FcnTodoappState();
}

class _FcnTodoappState extends State<FcnTodoapp> {
  List<Map<String, dynamic>> tasks = [];
  bool showActiveTask = true;

  void addTask(String task) {
    setState(() {
      tasks.add({'task': task, 'completed': false});
      Navigator.pop(context);
    });
  }

  void editTask(int index,String updateTask){
    setState(() {
      tasks[index]['task'] =updateTask;
      Navigator.pop(context);
    });
  }

  void showTaskDialog({int? index}) {
    // text edit kora condition a
    TextEditingController taskController = TextEditingController(
      text: index !=null ? tasks[index]['task'] : ''
    );
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(index !=null ? 'Edit Task' : 'Add Task'),
            content: TextField(
              controller: taskController,
              decoration: InputDecoration(hintText: 'Enter task'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancell', style: TextStyle(color: Colors.blue)),
              ),
              ElevatedButton(
                onPressed: () {
                  if (taskController.text.trim().isNotEmpty) {
                    // text edit
                    if(index != null){
                      editTask(index,taskController.text);
                    }else{
                      addTask(taskController.text);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: StadiumBorder(),
                ),
                child: Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
    );
  }

  void toggleTaskStatus(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  void deletetask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  // int activeCount1(){
  //   return  tasks.where((task) => !task['completed']).length;
  // } ...Avabeo nite pari

  int get activeCount => tasks.where((task) => !task['completed']).length;
  int get completedCount => tasks.where((task) => task['completed']).length;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredTasks =
        tasks.where((task) => task['completed'] != showActiveTask).toList();
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text('Functionally Todo App'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Clickable kora
              InkWell(
                onTap: () {
                  setState(() {
                    showActiveTask = true;
                  });
                },
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 4),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Text(
                            activeCount.toString(),
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Active',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  setState(() {
                    showActiveTask = false;
                  });
                },
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange,
                          blurRadius: 3,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Text(
                            completedCount.toString(),
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Completed',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(UniqueKey().toString()),
                  background: Container(
                    color: Colors.green,
                    child: Icon(Icons.check_box, color: Colors.white, size: 35),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Icon(Icons.delete, color: Colors.white, size: 35),
                  ),

                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      //task completed
                      toggleTaskStatus(index);
                    } else {
                      // delete task
                      deletetask(index);
                    }
                  },

                  child: Card(
                    margin: EdgeInsets.all(15),
                    child: ListTile(
                      title: Text(
                        filteredTasks[index]['task'],
                        style: TextStyle(
                          fontSize: 20,
                          // kete deoya
                          decoration:
                              filteredTasks[index]['completed']
                                  ? TextDecoration.lineThrough
                                  : null,
                        ),
                      ),

                      // Checkbox neoya
                      leading: Checkbox(
                          checkColor: Colors.blue,
                          shape: CircleBorder(),
                          value: filteredTasks[index]['completed'],
                          onChanged: (value)=> toggleTaskStatus(index),
                      ),

                      trailing: IconButton(
                          onPressed: ()=>showTaskDialog(index: index),
                          icon: Icon(Icons.edit),
                      ),

                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTaskDialog(),
        child: Card(
          color: Colors.blue,
          child: Icon(Icons.add, color: Colors.white, size: 38),
        ),
      ),
    );
  }
}
