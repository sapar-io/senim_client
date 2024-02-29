import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRef {
  // MARK: - Firestore
  static final root = FirebaseFirestore.instance;
  // Users
  static final users = root.collection(_FirestorePath.users);
  static DocumentReference user(String uid) => users.doc(uid);
  // Orders
  static final orders = root.collection(_FirestorePath.orders);
  static DocumentReference order(String id) => orders.doc(id);
  // Reports
  static final reports = root.collection(_FirestorePath.reports);
  static DocumentReference report(String id) => orders.doc(id);
}

class _FirestorePath {
  static String users = 'users';
  static String orders = 'orders';
  static String reports = 'reports';
}