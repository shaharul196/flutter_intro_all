import 'package:flutter/material.dart';
import 'expense_dataModel.dart';
import 'package:intl/intl.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final List<String> categories = ['Food','Transport','Entertaidment','Bill pay',];
  final List<Expense> _expense = [];
  double total = 0.0;

  void showForm() {
    String selectedCatagory = categories.first;
    TextEditingController titleController =TextEditingController();
    TextEditingController amountController =TextEditingController();
    DateTime expenseDateTime = DateTime.now();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                items:
                    categories.map((catagory) => DropdownMenuItem(
                            value: catagory,
                            child: Text(catagory),
                          )).toList(),
                onChanged: (value) => selectedCatagory = value!,
                decoration: InputDecoration(
                  labelText: 'Select any one',
                  labelStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )
                ),
              ),
              SizedBox(height: 20,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  if(titleController.text.isNotEmpty || double.tryParse(amountController.text) !=null){
                    adExpense(titleController.text,double.parse(amountController.text),expenseDateTime,selectedCatagory);
                    Navigator.pop(context);
                  }

                  },style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ), child: Text('Add expense',style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                ),)),
              ),
              SizedBox(height: 10,),
            ],
          ),
        );
      },
    );
  }

  void adExpense(String title,double amount,DateTime date ,String category){
    setState(() {
      _expense.add(Expense(title: title, amount: amount, date: date, category: category));
      total = total + amount;
      print(_expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpenseTracker App'),
        backgroundColor: Colors.pink,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showForm(),
            icon: Icon(Icons.add, size: 38, color: Colors.black),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Card(
                color: Colors.orange,
                margin: EdgeInsets.all(25),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    bottom: 50,
                    left: 100,
                    right: 100,
                  ),
                  child: Text('Total: ৳$total',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _expense.length,
                  itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue,
                        child: Text(_expense[index].category),
                      ),
                      title: Text(_expense[index].title),
                      subtitle: Text(
                          DateFormat.yMMMd().format(_expense[index].date)
                      ),
                    ),
                  );
              }),
            )
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
          onPressed: ()=>showForm(),
          child: Icon(Icons.add,color: Colors.red,size: 40,),
      ),
    );
  }
}


