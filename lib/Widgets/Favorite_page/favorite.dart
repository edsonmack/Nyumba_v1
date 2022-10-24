import 'package:flutter/material.dart';

Widget savedList() {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, top: 20),
    child: Column(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 140,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
          ),
          const SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Winners Hostel'),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Icons.location_pin),
                  Text('KM, Nairobi'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Icons.bed),
                  SizedBox(width: 5),
                  Text('bed-sitter 2 sharing'),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(4, 36, 47, 100),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                    child: Text(
                  'View',
                  style: TextStyle(color: (Colors.white)),
                )),
              ),
            ]),
          )
        ])
      ],
    ),
  );
}
