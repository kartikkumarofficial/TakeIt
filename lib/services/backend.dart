import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> saveUser(String uid, String name, String email) async {
    return await usersCollection.doc(uid).set({
      'name': name,
      'email': email,
      'profileImage': '',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<DocumentSnapshot> getUser(String uid) async {
    return await usersCollection.doc(uid).get();
  }

}
