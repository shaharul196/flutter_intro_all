import 'package:flutter/material.dart';
import 'counter_controller.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // TODO getx dependencies Controller
  // final CounterController controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterController>(
              // init: controller,
              // TODO avabe (_) dite pari
              builder: (controller) {
                return Text(
                  controller.count.toString(),
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              // TODO getx dependencies controller
              Get.find<CounterController>().decrement();
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              Get.find<CounterController>().increment();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
