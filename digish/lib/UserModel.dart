import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name;
  final String email;
  final String uid;

  const UserModel({
    required this.email,
    required this.name,
    required this.uid,
  });
  Map<String, dynamic> toJson() => {
        "Email": email,
        "Name": name,
        "User Id": uid,
      };
  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      name: snapshot['Name'],
      email: snapshot['Email'],
      uid: snapshot['User Id'],
    );
  }
}
