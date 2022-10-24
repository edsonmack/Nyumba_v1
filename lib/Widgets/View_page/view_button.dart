import 'package:flutter/material.dart';

class ViewButton extends StatefulWidget {
  const ViewButton({Key? key}) : super(key: key);

  @override
  State<ViewButton> createState() => _ViewButtonState();
}

class _ViewButtonState extends State<ViewButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            child: Text('Property for rent location'),
          ),
        ]),
      ),
    );
  }
}
