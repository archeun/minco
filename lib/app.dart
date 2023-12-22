import 'package:flutter/material.dart';
import 'package:minco/screens/authenticator/authenticator.dart';

class MincoApp extends StatelessWidget {
  const MincoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Authenticator(),
      initialRoute: Authenticator.routeName,
      routes: {
        Authenticator.routeName: (context) => const Authenticator(),
      },
    );
  }
}
