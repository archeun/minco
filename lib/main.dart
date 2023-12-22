import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (!kDebugMode) {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator('10.0.2.2', 8080);
    } catch (e) {
      print(e);
    }
  }
  await dotenv.load(fileName: ".env");
  runApp(const MincoApp());
}
