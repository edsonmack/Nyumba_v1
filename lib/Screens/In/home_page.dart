import 'package:flutter/material.dart';

import '../../Widgets/Home_page/category_buttons.dart';
import '../../Widgets/Home_page/house_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  height: 40,
                  width: 270,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: TextField(
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        fillColor: Colors.blue[50],
                        filled: true,
                        hintText: 'search',
                        prefixIcon: Icon(Icons.search),
                        iconColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        )),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 40,
                ),
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.sort))
              ],

              // serach button
            ),
            // categories row with three dots
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Categories',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            // hostels, appartments and houses buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                categoryButton('Hostels'),
                categoryButton('Appartments'),
                categoryButton('Houses'),
              ],
            ),

            Expanded(
              child: ListView(
                children: [
                  house(
                      'Waterpark Appartment',
                      7000,
                      'Kenyatta Market,Narobi',
                      Icons.bed_outlined,
                      'bed-sitter  sharing',
                      Icons.camera_alt,
                      'CCTV Security',
                      Icons.balcony_outlined,
                      'Balcony',
                      Icons.wifi,
                      'Free Wifi'),
                  house(
                      'Winners Hostel',
                      4000,
                      'Kenyatta Market,Narobi',
                      Icons.bed_outlined,
                      'bed-sitter 2 sharing',
                      Icons.camera_alt,
                      'CCTV Security',
                      Icons.balcony_outlined,
                      'Balcony',
                      Icons.wifi,
                      'Free Wifi'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
