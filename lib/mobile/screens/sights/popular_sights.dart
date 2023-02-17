import 'package:flutter/material.dart';

class PopularSightsScreen extends StatelessWidget {
  const PopularSightsScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = 'PopularSightsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('PopularSightsScreen'),
      ),
    );
  }
}