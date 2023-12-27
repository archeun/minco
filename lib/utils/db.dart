import 'package:cloud_firestore/cloud_firestore.dart';

mixin Db {
  final db = FirebaseFirestore.instance;
}
