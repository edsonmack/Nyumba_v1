// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nyumba/Screens/In/viewHousePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  // Category Widget
  Widget categoryButton(String? text) {
    return Builder(builder: (context) {
      return Container(
        height: 40,
        width: 105,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 89, 58, 143),
          borderRadius: BorderRadius.circular(5),
        ),
        // ignore: prefer_const_constructors
        child: Center(
          child: Text(
            '$text',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    });
  }

  // House widget
  Widget house(
      String? faciltyName,
      int rent,
      String? location,
      IconData bedIcon,
      String? bedType,
      IconData amenityIcon1,
      String? amenity1,
      IconData amenityIcon2,
      String? amenity2,
      IconData amenityIcon3,
      String? amenity3) {
    return Builder(builder: (context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$faciltyName'),
                Text('Ksh. $rent/month'),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.location_pin),
              Text('$location'),
              const SizedBox(
                width: 85,
              ),

              // OnTap Method
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ViewButton()));
                },
                child: Container(
                  // ignore: sort_child_properties_last
                  child: const Center(
                    child: Text(
                      'View',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                  height: 40,
                  width: 85,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(4, 36, 47, 100),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              //const OnTap(),
            ],
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Row(
              children: [
                Icon(bedIcon),
                Text('$bedType'),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(amenityIcon1),
              Text('$amenity1'),
              const SizedBox(width: 10),
              Icon(amenityIcon2),
              Text('$amenity2'),
              const SizedBox(width: 10),
              Icon(amenityIcon3),
              Text('$amenity3'),
            ],
          ),
        ],
      );
    });
  }

  // Search Widget
  Widget Search() {
    return TextField(
      decoration: InputDecoration(
          fillColor: Colors.blue[50],
          filled: true,
          hintText: 'search',
          prefixIcon: const Icon(Icons.search),
          iconColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: TextField(
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                          fillColor: Colors.blue[50],
                          filled: true,
                          hintText: 'search',
                          prefixIcon: const Icon(Icons.search),
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
                      child: const Icon(Icons.sort))
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
              const SizedBox(
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
                child: SizedBox(
                  height: 200,
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
                      const SizedBox(height: 5.0),
                      const Divider(
                        height: 40.0,
                        color: Colors.black,
                      ),
                      house(
                          'Winners Hostel',
                          4000,
                          'Kenyatta Market,Narobi ',
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
