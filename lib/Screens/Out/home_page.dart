import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:nyumba/Screens/In/bottomNavigator.dart';
import 'package:nyumba/Screens/In/home_page.dart';
import 'package:nyumba/Screens/Out/Login_screen.dart';

class HomPage extends StatelessWidget {
  const HomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BottomNav();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
