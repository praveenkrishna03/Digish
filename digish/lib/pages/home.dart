import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  home_state createState() => home_state();
}

class home_state extends State<home> {
  Future Usercheck() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Name, email address, and profile photo URL
      final name = user.displayName;
      final email = user.email;
      final photoUrl = user.photoURL;

      // Check if user's email is verified
      final emailVerified = user.emailVerified;

      // The user's ID, unique to the Firebase project. Do NOT use this value to
      // authenticate with your backend server, if you have one. Use
      // User.getIdToken() instead.
      final uid = user.uid;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.logout_outlined))
          ],
        ),
        body: Center(
          child: Text("Home"),
        ));
  }
}
