import 'package:flutter/material.dart';
import 'package:minco/screens/home/home.dart';

class MincoApp extends StatelessWidget {
  const MincoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minco',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => const Home(),
      },
    );
  }
}
