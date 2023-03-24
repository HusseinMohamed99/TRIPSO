import 'package:flutter/material.dart';

class AllPlansScreen extends StatelessWidget {
  const AllPlansScreen({Key? key}) : super(key: key);
  static const String routeName = 'AllPlansScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('AllPlansScreen')),
    );
  }
}
