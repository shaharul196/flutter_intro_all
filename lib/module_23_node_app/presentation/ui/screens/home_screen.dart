import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_23_node_app/presentation/ui/widgets/custom_input_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

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
            SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {},style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.black,
              ), child: Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}
