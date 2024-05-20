import 'package:digish/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:digish/pages/signup.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  Login_state createState() => Login_state();
}

class Login_state extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  Future signInWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('user not found')),
        );
      } else if (e.code == 'wrong-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('wrong password')),
        );
      } else if (e.code == 'invalid-email') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('invalid email format')),
        );
      } else {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please the credentials')),
        );
      }
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
              top: 427,
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
                  controller: _passwordController,
                  keyboardType: TextInputType.name,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 109, 109, 109),
                    ),
                    hintText: 'Enter your Password',
                  ),
                ),
              ),
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width - 300) / 2,
              top: 550,
              child: Container(
                  height: 20,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?  ",
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
                          Get.offAll(() => Signup(),
                              transition: Transition.fadeIn);
                        },
                        child: Text(
                          'Create one',
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
              top: 600,
              child: SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your login logic here
                    signInWithEmailAndPassword();
                    // Do something with email and password
                  },
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.black,
                        ))
                      : Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inconsolata',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
