import 'package:flutter/material.dart';
import 'package:minco/themes/minco.dart';
import 'package:minco/utils/routes.dart';

class MincoApp extends StatelessWidget {
  const MincoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Minco.defaultTheme,
      initialRoute: MincoRoutes.initialRoute,
      routes: MincoRoutes.getRoutes(),
    );
  }
}
