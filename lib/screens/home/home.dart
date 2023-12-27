import 'package:flutter/material.dart';
import 'package:minco/config/styles.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primary,
        foregroundColor: Colors.white,
        title: const Text('Minco'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Minco Home Page',
            ),
          ],
        ),
      ),
    );
  }
}
