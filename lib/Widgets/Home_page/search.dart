import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
