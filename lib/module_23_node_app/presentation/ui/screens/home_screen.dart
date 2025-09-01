import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_23_node_app/data/database/information_controller.dart';
import 'package:ostad_flutter_sazu/module_23_node_app/presentation/ui/widgets/custom_input_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  late InformationController informationController; /// sharedPreference instance
  List<String> list = [];

  Future<void> _loadData()async {
    await informationController.getData();
    setState(() {});
    list = informationController.list;
  }

  Future<void> addData() async {
    if (_numberController.text.isEmpty || _numberController.text.isEmpty) {
      return;
    }
    list.addAll([_nameController.text,_numberController.text]);

    await informationController.setData(list);
    setState(() {});
    _nameController.clear();
    _numberController.clear();
  }

  void removeItem(int index){
    list.removeAt(index);
    setState(() {});
    informationController.setData(list);
  }

  @override
  void initState() {
    super.initState();
    informationController = InformationController();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Node app'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomInputField(controller: _nameController, hintText: 'Name'),
            SizedBox(height: 10),
            CustomInputField(controller: _numberController, hintText: 'Number'),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  addData();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black,
                ),
                child: Text('Save'),
              ),
            ),
            SizedBox(height: 8,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await informationController.removeAllData();
                  setState(() {});
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  foregroundColor: Colors.black,
                ),
                child: Text('Remove all'),
              ),
            ),
            SizedBox(height: 20,),

            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onLongPress: (){
                      removeItem(index);
                    },
                    child: ListTile(
                      title: Text(list[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
