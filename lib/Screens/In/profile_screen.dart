import 'package:flutter/material.dart';
import 'package:nyumba/Widgets/Profile_page/buttons.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Text(
                      'E',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            const SizedBox(height: 20),
            const Text('Edson Lauwo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.00,
                )),
            const SizedBox(height: 20.00),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Need Help?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            buttons((Icons.chat_sharp), 'Chat with us?'),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            buttons(Icons.person, 'Personal Details'),
            const SizedBox(
              height: 15,
            ),
            buttons(Icons.notifications, 'Notifications'),
            const SizedBox(
              height: 15,
            ),
            buttons(Icons.lock, 'Change Passowrd'),
            const SizedBox(
              height: 15,
            ),
            buttons(Icons.logout, 'Sign Out')
          ],
        ),
      ),
    );
  }
}
