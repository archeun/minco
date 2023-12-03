import 'package:flutter/material.dart';
import 'package:minco/config/styles.dart';
import 'package:minco/screens/home/home.dart';
import 'package:minco/screens/splash/splash.dart';

class MincoApp extends StatelessWidget {
  const MincoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minco',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Styles.primary),
        useMaterial3: true,
      ),
      home: const Home(),
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (context) => const Splash(),
        Home.routeName: (context) => const Home(),
      },
    );
  }
}
