import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nyumba/Screens/In/locationPage.dart';

import 'package:nyumba/Screens/In/profile_screen.dart';

class NewListings extends StatefulWidget {
  const NewListings({super.key});

  @override
  State<NewListings> createState() => _NewListingsState();
}

class _NewListingsState extends State<NewListings> {
  final _formKey2 = GlobalKey<FormState>();

  // Category facility list
  final categoryList = ['Hostel', 'Appartment', 'House'];
  String? selectedValue = 'Hostel';

  // Room list
  final roomList = [
    'Single room',
    'Bed-sitter',
    'Bed-sitter 2 sharing',
    'One bedroom',
    'Two bedrooms'
  ];
  String selectedValue1 = 'Single room';

  // Editing controller
  final nameController = TextEditingController();
  final rentController = TextEditingController();
  final descriptionController = TextEditingController();

  // Accomodation name textfield widget
  Widget accomodationName() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: 'Facility Name',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  // Accomodation Category widget
  Widget accomodationCategory() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DropdownButtonFormField(
        value: selectedValue,
        items: categoryList
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: (val) {
          setState(() {
            selectedValue = val! as String;
          });
        },
        icon: Icon(Icons.arrow_drop_down_circle),
        decoration: InputDecoration(
          labelText: 'Facility Category',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  // Room type
  Widget roomType() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DropdownButtonFormField(
        value: selectedValue1,
        items: roomList
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: (val) {
          setState(() {
            selectedValue1 = val! as String;
          });
        },
        icon: Icon(Icons.arrow_drop_down_circle),
        decoration: InputDecoration(
          labelText: 'Room type',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

// rent Widget
  Widget rentAmount() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 5),
      child: TextFormField(
        controller: rentController,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: const InputDecoration(
          labelText: 'Rent (Ksh) / Month',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
  // Location Widget

  Widget locationOption() {
    return Container(
        height: 60,
        width: 350,
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LocationPage()));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Location',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              Icon(
                Icons.navigate_next,
                color: Colors.black,
              ),
            ],
          ),
        ));
  }

  // Description widget
  Widget descriptionOption() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: descriptionController,
        keyboardType: TextInputType.multiline,
        maxLines: 10,
        minLines: 1,
        decoration: InputDecoration(
          labelText: 'Description',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create a new Listing",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Profile()));
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              key: _formKey2,
              child: Column(
                children: [
                  accomodationName(),
                  rentAmount(),
                  accomodationCategory(),
                  roomType(),
                  locationOption(),
                  descriptionOption(),
                ],
              )),
        ),
      ),
    );
  }
}
