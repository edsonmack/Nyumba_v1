import 'package:flutter/material.dart';

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
