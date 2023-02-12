import 'package:flutter/material.dart';

class SightsScreen extends StatelessWidget {
  const SightsScreen({Key? key}) : super(key: key);
  static const String routeName = 'SightsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('SightsScreen'),
      ),
    );
  }
}