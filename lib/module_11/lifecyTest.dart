import 'package:flutter/material.dart';

class lifetestall extends StatefulWidget {
  const lifetestall({super.key});

  @override
  State<lifetestall> createState() => _lifetestallState();
}

class _lifetestallState extends State<lifetestall> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('IniState from page 2');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies called');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('Dispose from page 2');
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
