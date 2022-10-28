// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:nyumba/Screens/In/bottomNavigator.dart';

class ViewButton extends StatefulWidget {
  const ViewButton({Key? key}) : super(key: key);

  @override
  State<ViewButton> createState() => _ViewButtonState();
}

class _ViewButtonState extends State<ViewButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('house details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const BottomNav()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 250,
              color: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 16.0,
              ),
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0),
                    const Text('Winners Hostel'),
                    const SizedBox(height: 8.0),
                    const Text('Rent: Ksh. 4000/ month'),
                    const SizedBox(height: 8.0),
                    Row(
                      children: const [
                        Icon(Icons.bed),
                        SizedBox(width: 5.0),
                        Text('Bed-sitter 2 sharing'),
                        SizedBox(height: 8.0),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    const Text('Units available: 5'),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(4, 36, 47, 100)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 140.00),
                        child: Text('Book'),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(226, 231, 231, 100)),
                      icon: const Icon(Icons.favorite),
                      label: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('Save'),
                      )),
                  const SizedBox(width: 10.0),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.message),
                      label: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('Chat'),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            const Divider(
              color: Colors.black,
              height: 40.0,
              endIndent: 20.0,
              indent: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, left: 10),
              child: Text(
                'Property for rent location',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                width: 380,
                color: (Colors.blue),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 40.0,
              endIndent: 20.0,
              indent: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Most popular Facilities',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Icon(Icons.camera_indoor_outlined),
                  SizedBox(width: 5.0),
                  Text('CCTV'),
                  SizedBox(width: 10.0),
                  Icon(Icons.pets),
                  SizedBox(width: 5.0),
                  Text('Pets allowed'),
                  SizedBox(width: 10.0),
                  Icon(Icons.wifi),
                  SizedBox(width: 5.0),
                  Text('WiFi Available'),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 40.0,
              endIndent: 20.0,
              indent: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
            ),
            const Divider(
              color: Colors.black,
              height: 40.0,
              endIndent: 20.0,
              indent: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Seller Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(width: 10.0),
                Text('Edson Lauwo'),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
