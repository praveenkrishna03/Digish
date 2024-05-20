import 'package:digish/UserModel.dart';
import 'package:digish/widget_tree.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:digish/pages/login.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  @override
  Signup_state createState() => Signup_state();
}

class Signup_state extends State<Signup> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool isLoading = false;

  Future createUserWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      final user = FirebaseAuth.instance.currentUser;
      await user?.updateDisplayName(_nameController.text);
      await user?.updatePhotoURL(
          "https://firebasestorage.googleapis.com/v0/b/digish-db74b.appspot.com/o/3177440.png?alt=media&token=140cda74-ce4c-4e28-8e6d-403c6d2660a2");
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration successful')),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The password provided is too weak.')),
        );
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('The account already exists for that email.')),
        );
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/login_page.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width - 300) / 2,
              top: 425,
              child: Container(
                width: 300,
                height: 40,
                decoration: ShapeDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  cursorColor: Colors.black,
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 109, 109, 109),
                    ),
                    hintText: 'Enter your name',
                  ),
                ),
              ),
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width - 300) / 2,
              top: 500,
              child: Container(
                width: 300,
                height: 40,
                decoration: ShapeDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  cursorColor: Colors.black,
                  controller: _emailController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 109, 109, 109),
                    ),
                    hintText: 'Enter your email',
                  ),
                ),
              ),
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width - 300) / 2,
              top: 575,
              child: Container(
                width: 300,
                height: 40,
                decoration: ShapeDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  cursorColor: Colors.black,
                  controller: _passwordController,
                  keyboardType: TextInputType.name,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 109, 109, 109),
                    ),
                    hintText: 'Create password',
                  ),
                ),
              ),
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width - 300) / 2,
              top: 650,
              child: Container(
                width: 300,
                height: 40,
                decoration: ShapeDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  cursorColor: Colors.black,
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.name,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 109, 109, 109),
                    ),
                    hintText: 'Confirm password',
                  ),
                ),
              ),
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width - 300) / 2,
              top: 700,
              child: Container(
                  height: 20,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?  ",
                        style: TextStyle(fontSize: 12),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .transparent, // Background color set to transparent
                          shadowColor: Colors
                              .transparent, // Shadow color set to transparent
                          minimumSize:
                              Size(80, 40), // Width and height of the button
                        ),
                        onPressed: () {
                          Get.offAll(() => Login(),
                              transition: Transition.fadeIn);
                        },
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.green.shade900,
                            fontSize: 13,
                            fontFamily: 'Inria Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width - 150) / 2,
              top: 725,
              child: SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your login logic here
                    String c_password = _confirmPasswordController.text;

                    String password = _passwordController.text;
                    if (password.isEmpty || c_password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('password field is empty')),
                      );
                      // Show error message or snackbar indicating that both password and confirm password are required
                    } else if (password != c_password) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("password doesn't match")),
                      );
                      // Show error message or snackbar indicating that passwords don't match
                    } else {
                      createUserWithEmailAndPassword();
                      Get.offAll(() => WidgetTree(),
                          transition: Transition.fade);
                    }

                    // Do something with email and password
                  },
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.black,
                        ))
                      : Text(
                          'Signup',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inconsolata',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
