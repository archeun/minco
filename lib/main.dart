import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kDebugMode) {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator('10.0.2.2', 8080);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
  runApp(const MincoApp());
}

class MincoApp extends StatelessWidget {
  const MincoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minco',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MincoHomePage(title: 'Minco Home Page'),
    );
  }
}

class MincoHomePage extends StatelessWidget {
  const MincoHomePage({super.key, required this.title});

  final String title;

  void writeEntryToFirebase() {
    FirebaseFirestore.instance.collection("entries").add(<String, String>{
      'title': 'Created at: ${DateTime.now().toString()}',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Minco Home Page',
            ),
            TextButton(
              onPressed: writeEntryToFirebase,
              child: const Text('Write to DB'),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
