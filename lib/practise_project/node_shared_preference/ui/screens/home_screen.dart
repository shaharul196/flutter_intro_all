import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/practise_project/node_shared_preference/data/database/info_controller.dart';
import '../widgets/custom_input_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  List<String> list = [];
  late InformationController informationController;

  Future<void> addsData() async {
    // if(nameController.text.isEmpty || quantityController.text.isEmpty) return;
    list.addAll([nameController.text,quantityController.text]);
    await informationController.setData(list);
    setState(() {});
     nameController.clear();
     quantityController.clear();
  }

  Future<void> loadData() async {
    await informationController.getData();
    setState(() {});
    list = informationController.list;
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
    loadData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Node app'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomInputField(hintText: 'Name', controller: nameController),
            SizedBox(height: 8),
            CustomInputField(
              hintText: 'quantity',
              controller: quantityController,
            ),
            SizedBox(height: 16,),
            ElevatedButton(onPressed: (){
              addsData();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.black,
            ), child: Text('Save')),

            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                  itemBuilder: (context, index) {
                return InkWell(
                  onLongPress: (){
                    removeItem(index);
                  },
                  child: ListTile(
                    title: Text(list[index],),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
