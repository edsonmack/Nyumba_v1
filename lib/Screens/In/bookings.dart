import 'package:flutter/material.dart';
import 'package:nyumba/Screens/In/bottomNavigator.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  int counter = 0;

  // pending page
  Widget pendingPage() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 140,
        width: 150,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'images/one.jpg',
              ),
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
      ),
      const SizedBox(width: 5),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Winners Hostel'),
        const SizedBox(height: 5),
        Row(
          children: const [
            Icon(Icons.location_pin),
            Text('KM, Nairobi'),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: const [
            Icon(Icons.bed),
            SizedBox(width: 5),
            Text('bed-sitter 2 sharing'),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: const [
            Text('Request No: 21028'),
            SizedBox(width: 5),
            Icon(Icons.copy),
          ],
        ),
        const SizedBox(height: 5),
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
  // completed page

  Widget completedPage() {
    return const Text('tab 2 ');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Bookings",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const BottomNav()));
              },
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: [
                  const TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Color.fromRGBO(4, 36, 47, 100),
                      tabs: [
                        Tab(
                          text: 'Pending',
                          height: 25,
                        ),
                        Tab(text: 'Completed'),
                      ]),
                  const SizedBox(height: 10),
                  Expanded(
                      child: TabBarView(children: [
                    pendingPage(),
                    completedPage(),
                  ])),
                  const SizedBox(height: 10),
                ],
              ))),
    );
  }
}
