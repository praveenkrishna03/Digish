import 'package:digish/main.dart';
import 'package:digish/pages/account/about_us.dart';
import 'package:digish/pages/account/my_orders.dart';
import 'package:digish/pages/account/payment_opt.dart';
import 'package:digish/pages/account/receive_opt.dart';
import 'package:digish/pages/account/terms.dart';
import 'package:digish/widget_tree.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../home.dart';

class Account extends StatefulWidget {
  @override
  Account_state createState() => Account_state();
}

class Account_state extends State<Account> {
  String? name;
  String? email;
  String? photoUrl;
  bool? emailVerified;
  String? uid;
  bool email_verification_sent = false;
  bool phone_verification_sent = false;

  Future Usercheck() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Name, email address, and profile photo URL
      name = user.displayName;
      email = user.email;
      photoUrl = user.photoURL;

      // Check if user's email is verified
      setState(() {
        emailVerified = user.emailVerified;
      });

      // The user's ID, unique to the Firebase project. Do NOT use this value to
      // authenticate with your backend server, if you have one. Use
      // User.getIdToken() instead.
      uid = user.uid;
      print("Name:$name");
      print("Email:$email");
      print("PhotoURL:$photoUrl");
      print("Email verify:$emailVerified");
      print("UID:$uid");
    }
  }

  void showEmailNotVerified() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Color.fromARGB(255, 26, 123, 51),
        title: Text(
          'Email Not Verified',
          style: TextStyle(color: Colors.white70),
        ),
        content: Text(
          'Please verify your email to continue.',
          style: TextStyle(color: Colors.white60),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'OK',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
      transitionDuration: Duration(milliseconds: 400),
    );
  }

  void showEmailVerficationSent() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Color.fromARGB(255, 26, 123, 51),
        title: Text(
          'Email Verification Sent',
          style: TextStyle(color: Colors.white70),
        ),
        content: Text(
          "Please check your email and click the verification link. Then return to the app and Logout once and then Login to get Verified",
          style: TextStyle(color: Colors.white60),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'OK',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
      transitionDuration: Duration(milliseconds: 400),
    );
  }

  @override
  void initState() {
    super.initState();
    Usercheck();
  }

  @override
  Widget build(BuildContext context) {
    void signout() async {
      await FirebaseAuth.instance.signOut();
      Get.offAll(
        () => WidgetTree(),
      );
      // Use Get.offAll to replace all existing routes
    }

    final options = [
      {
        'icon': FirebaseAuth.instance.currentUser?.emailVerified ?? false
            ? Icons.verified
            : Icons.mail_outlined,
        'name': 'Verify Email',
        'action': () async {
          if (!FirebaseAuth.instance.currentUser!.emailVerified &&
              !email_verification_sent) {
            await FirebaseAuth.instance.currentUser?.sendEmailVerification();
            showEmailVerficationSent();
            email_verification_sent = true;
          } else if (!FirebaseAuth.instance.currentUser!.emailVerified &&
              email_verification_sent) {
            Usercheck();
            Get.to(() => home(), transition: Transition.fadeIn);
          } else if (FirebaseAuth.instance.currentUser!.emailVerified) {
            return ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Email Verified')),
            );
          }
        },
      },
      {
        'icon': Icons.phonelink_ring_rounded,
        'name': 'Verify phone number',
        'action': () {
          print('Business tapped');
        }
      },
      {
        'icon': Icons.payment_rounded,
        'name': 'Payment method',
        'action': () {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            Get.to(
              () => Payment_opt(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 300),
            );
          } else {
            showEmailNotVerified();
          }
        }
      },
      {
        'icon': Icons.handshake_outlined,
        'name': 'Receiving method',
        'action': () {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            Get.to(
              () => Receive_opt(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 300),
            );
          } else {
            showEmailNotVerified();
          }
        }
      },
      {
        'icon': Icons.delivery_dining_rounded,
        'name': 'My orders',
        'action': () {
          Get.to(
            () => My_orders(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 300),
          );
        }
      },
      {
        'icon': Icons.description_outlined,
        'name': 'Terms & srevices',
        'action': () {
          Get.to(
            () => Terms(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 300),
          );
        }
      },
      {
        'icon': Icons.info_outline_rounded,
        'name': 'About us',
        'action': () {
          Get.to(
            () => About_us(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 300),
          );
        }
      },
      {
        'icon': Icons.logout_rounded,
        'name': 'Logout',
        'action': signout,
      },
    ];
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(
            255, 163, 230, 165), // Set your desired background color here
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/digish-db74b.appspot.com/o/3177440.png?alt=media&token=140cda74-ce4c-4e28-8e6d-403c6d2660a2"),
                ),
                SizedBox(height: 20),
                Text(
                  '$name',
                  style: TextStyle(
                    color: Colors.black, // Changed to black for visibility
                    fontSize: 23,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '$email',
                  style: TextStyle(
                    color: Colors.black, // Changed to black for visibility
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: option['action'] as VoidCallback,
                        child: Row(
                          children: [
                            Icon(
                              option['icon'] as IconData,
                              size: 30.0,
                            ),
                            SizedBox(width: 20),
                            Text(
                              option['name'] as String,
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      if (index < options.length)
                        Divider(
                          color: Colors.grey,
                        ), // Add Divider except after the last option
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
