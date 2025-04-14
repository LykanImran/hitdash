import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final double elevation;
  final Widget child;
  const BaseCard({super.key, this.elevation = 4, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
