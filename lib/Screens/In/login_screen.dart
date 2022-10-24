import 'package:flutter/material.dart';
import 'package:nyumba/Screens/In/bookings.dart';
import 'package:nyumba/Screens/In/favorite_screen.dart';
import 'package:nyumba/Screens/In/home_page.dart';
import 'package:nyumba/Screens/In/profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int currentIndex = 0;
  final screens = const [HomePage(), Favorite(), Bookings(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_copy), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
      ),
    );
  }
}
