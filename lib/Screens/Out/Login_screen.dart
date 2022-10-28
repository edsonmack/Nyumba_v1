// ignore_for_file: file_names

import 'package:auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nyumba/Screens/In/bottomNavigator.dart';
import 'package:nyumba/firebase_options.dart';
import 'Registration_screen.dart';
import 'Reset_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  // scaffold state

// form screen for validating email and password

  final _formKey = GlobalKey<FormState>();

  // editing controller

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  // firebase authenticator

  // google sign Method
  Future<void> _googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();

    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null)
        // ignore: curly_braces_in_flow_control_structures
        try {
          await FirebaseAuth.instance.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
        } finally {}
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      //validator: ,
      validator: (value) {
        if (value!.isEmpty) {
          return ("please enter your email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordcontroller,
      obscureText: true,
      //validator: ,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("please enter password");
        }

        if (!regex.hasMatch(value)) {
          return ("please enter valid password (min 6 characters)");
        } else {
          return null;
        }
      },
      onSaved: (value) {
        passwordcontroller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromRGBO(4, 36, 47, 100),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          setState(() {
            showSpinner = true;
          });

          if (_formKey.currentState!.validate()) {
            Fluttertoast.showToast(msg: "Login Successful");
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const BottomNav()));
          }
          await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          );
          final email = emailcontroller.text;
          final password = passwordcontroller.text;

          final userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          print(userCredential);
          // ignore: nullable_type_in_catch_clause

          // ignore: avoid_print
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final continueWithGoogleButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromRGBO(226, 231, 231, 100),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          _googleSignIn();
        },
        child: const Text(
          "Continue with Google",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NYUMBA ACCOUNT LOGIN",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Center(
              child: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 5),
                            emailField,
                            const SizedBox(height: 45),
                            passwordField,
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                const ResetPassword())));
                                  },
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.blue,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            loginButton,
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  "Or",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            (continueWithGoogleButton),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    final user =
                                        FirebaseAuth.instance.currentUser;
                                    if (user?.emailVerified ?? false) {
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const RegistrationScreen())));
                                    }
                                  },
                                  child: const Text(
                                    "Create Account Instead?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ))),
            ),
          );
        },
      ),
    );
  }
}
