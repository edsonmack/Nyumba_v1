// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:nyumba/Screens/In/bookings.dart';
import 'package:nyumba/Screens/In/favorite_screen.dart';
import 'package:nyumba/Screens/In/home_page.dart';
import 'package:nyumba/Screens/In/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNav> {
  int currentIndex = 0;
  final screens = const [HomePage(), Favorite(), Bookings(), Profile()];
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
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
