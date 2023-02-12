import 'package:flutter/material.dart';

class HistoricalCity extends StatelessWidget {
  const HistoricalCity({Key? key}) : super(key: key);
  static const String routeName = 'HistoricalCity';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('HistoricalCity'),
      ),
    );
  }
}
