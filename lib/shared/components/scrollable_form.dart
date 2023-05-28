import 'package:flutter/material.dart';

class CustomScrollableForm extends StatelessWidget {
  final Widget child;

  const CustomScrollableForm({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        )
      ],
    );
  }
}