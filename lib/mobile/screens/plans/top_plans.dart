import 'package:flutter/material.dart';

class TopPlansScreen extends StatelessWidget {
  const TopPlansScreen({Key? key}) : super(key: key);
  static const String routeName = 'TopPlansScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'Top Plans Screen',
        ),
      ),
    );
  }
}
