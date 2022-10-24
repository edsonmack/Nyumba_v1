import 'package:flutter/material.dart';

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
  return Column(children: [
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
      padding: const EdgeInsets.only(top: 10.0),
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
      children: [
        const Icon(Icons.location_pin),
        Text('$location'),
        const SizedBox(
          width: 90,
        ),
        Container(
          child: const Center(
            child: Text(
              'Book',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ),
          height: 40,
          width: 90,
          decoration: BoxDecoration(
            color: Color.fromRGBO(4, 36, 47, 100),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    ),
    Row(
      children: [
        Icon(bedIcon),
        Text('$bedType'),
      ],
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
  ]);
}
