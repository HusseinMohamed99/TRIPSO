import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../shared/components/app_bar.dart';

class HomeLayout extends StatelessWidget {

  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: defaultAppBar(),
      body: const Text('HOME LAYOUT'),
    );
  }
}
