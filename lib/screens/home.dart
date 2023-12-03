import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      ),
    );
  }
}
