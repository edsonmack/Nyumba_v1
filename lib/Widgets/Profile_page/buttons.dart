import 'package:flutter/material.dart';

Widget buttons(IconData icon, String? text) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black)),
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text('$text'),
        ],
      ),
    ),
  );
}
