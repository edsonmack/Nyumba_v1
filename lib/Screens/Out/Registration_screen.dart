// ignore_for_file: file_names

import 'package:auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nyumba/Screens/Out/Verify_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nyumba/firebase_options.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // Editing controller
  final emailEditingController = TextEditingController();
  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final categoryEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final retypePasswordEditingController = TextEditingController();

  // Drop down menu state
  List<String> items = ['Category', 'Student', 'Landlord'];
  String? selectedItem = 'Category';
  @override
  Widget build(BuildContext context) {
    // email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      //validator: ,
      validator: (value) {
        if (value!.isEmpty) {
          return ("please enter your email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        } else {
          return null;
        }
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      //validator: ,
      validator: (value) {
        if (value!.isEmpty) {
          return ("please enter your first name");
        } else {
          return null;
        }
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final lastNameField = TextFormField(
      autofocus: false,
      controller: lastNameEditingController,
      //validator: ,
      validator: (value) {
        if (value!.isEmpty) {
          return ("please enter your last name");
        } else {
          return null;
        }
      },
      onSaved: (value) {
        lastNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final categoryField = TextFormField(
      autofocus: false,
      controller: categoryEditingController,
      //validator: ,
      validator: (value) {
        if (value!.isEmpty) {
          return ("please enter Category");
        }
        return null;
      },
      onSaved: (value) {
        categoryEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Category",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
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
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final retypePasswordField = TextFormField(
      autofocus: false,
      controller: retypePasswordEditingController,
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
        retypePasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Retype password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromRGBO(4, 36, 47, 100),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            Fluttertoast.showToast(
                msg: "Registration Successful, Proceed to verify email");

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const VerifyScreen()));
          }

          await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          );
          final email = emailEditingController.text;
          final password = passwordEditingController.text;

          final userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          // ignore: avoid_print
          print(userCredential);
        },
        child: const Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Account",
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
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      emailField,
                      const SizedBox(height: 20),
                      firstNameField,
                      const SizedBox(height: 20),
                      lastNameField,
                      const SizedBox(height: 20),
                      categoryField,
                      const SizedBox(height: 20),
                      passwordField,
                      const SizedBox(height: 20),
                      retypePasswordField,
                      const SizedBox(height: 20),
                      signUpButton,
                    ],
                  ),
                ))),
      ),
    );
  }
}
