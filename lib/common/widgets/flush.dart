import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Flush extends StatelessWidget {
  final String title;
  final String message;

  const Flush({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Flushbar(
      icon: const Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      title: title,
      message: message,
      backgroundGradient:
          const LinearGradient(colors: [Colors.blue, Colors.teal]),
      boxShadows: const [
        BoxShadow(
          color: Colors.blue,
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        ),
      ],

      duration: const Duration(seconds: 3),
      // leftBarIndicatorColor: Colors.blue,
    )..show(context);
  }
}
