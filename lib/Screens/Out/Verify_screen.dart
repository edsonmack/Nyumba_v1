// ignore_for_file: file_names

import 'package:auth/auth.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  // send email verification method
  Future sendVerif() async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Verify Email",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const Text(
            'Click the button below to verify your email address',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                sendVerif();
                const snackbar = SnackBar(
                    content: Text("Email sent, kindly check your email",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
              child: const Text('send email verification'))
        ]),
      ),
    );
  }
}
