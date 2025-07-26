import 'package:get/get.dart';

class CounterController extends GetxController {
  int _count = 0;

  // TODO getter method
  int get count => _count;

  void increment() {
    _count++;
    update();
  }

  void decrement() {
    if(count <= 0){
      // TODO true hole minus(-) korte dibe na
      return;
    }
    _count--;
    update();
  }
}