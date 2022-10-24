import 'package:flutter/material.dart';
import 'package:nyumba/Widgets/Booking_Page/completed_page.dart';

import 'package:nyumba/Widgets/Booking_Page/pending_page.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  int counter = 0;
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
                Navigator.of(context).pop();
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
