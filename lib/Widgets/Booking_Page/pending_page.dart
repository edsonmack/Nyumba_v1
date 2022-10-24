import 'package:flutter/material.dart';

Widget pendingPage() {
  return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(
      height: 140,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
    ),
    const SizedBox(width: 5),
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Winners Hostel'),
      SizedBox(height: 5),
      Row(
        children: const [
          Icon(Icons.location_pin),
          Text('KM, Nairobi'),
        ],
      ),
      SizedBox(height: 5),
      Row(
        children: const [
          Icon(Icons.bed),
          SizedBox(width: 5),
          Text('bed-sitter 2 sharing'),
        ],
      ),
      SizedBox(height: 5),
      Row(
        children: const [
          Text('Request No: 21028'),
          SizedBox(width: 5),
          Icon(Icons.copy),
        ],
      ),
      SizedBox(height: 5),
      Row(
        children: const [
          Icon(Icons.message_rounded),
          SizedBox(width: 5),
          Text('Chat the Owner'),
        ],
      )
    ])
  ]);
}
