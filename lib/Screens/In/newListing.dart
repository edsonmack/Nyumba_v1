import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nyumba/Repositories/cloud_repository.dart';
import 'package:nyumba/Screens/In/locationPage.dart';
import 'package:nyumba/Screens/In/profile_screen.dart';
import 'package:nyumba/locator.dart';

class NewListings extends StatefulWidget {
  const NewListings({super.key});

  @override
  State<NewListings> createState() => _NewListingsState();
}

class _NewListingsState extends State<NewListings> {
  final _formKey2 = GlobalKey<FormState>();
  // ListingModel listingObject = ListingModel
  // Image picker global file variable

//  File? _image;

  // Function that receives Image
  /* Future _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    try {
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }
*/
// Image picker object
  final ImagePicker imagePicker = ImagePicker();

  // array receiving list of files
  List<File> imageFileList = [];

  // Download urls
  List<String> downloadUrls = [];

  // array for storing files
  //File? imageFileList;

  // Method for uploading images
  Future<String> uploadFile(File file) async {
    final metadata = SettableMetadata(contentType: 'images/jpg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref =
        storageRef.child('images/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metadata);

    final taskSnapshot = await uploadTask.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

// method for selecting images
  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      selectedImages.forEach((e) {
        imageFileList.add(File(e.path));
      });
    }
    setState(() {});
  }

  // method for storing photos to firestore
  storeEntry(List<String> imageUrls) {
    FirebaseFirestore.instance
        .collection('Listings')
        .add({'imageUrl': imageUrls}).then(
            (value) => {Fluttertoast.showToast(msg: 'successful')});
  }

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

  // Checkbox values Initialization
  bool? checkBoxValue1 = false;
  bool? checkBoxValue2 = false;
  bool? checkBoxValue3 = false;
  bool? checkBoxValue4 = false;
  bool? checkBoxValue5 = false;
  bool? checkBoxValue6 = false;
  bool showSpinner = false;

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
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
        top: 20,
      ),
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

// check box widget

  // What this place offers available (check boxOptions)
  Widget commonFacilities() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'What this place offers',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // checkbox1
              Checkbox(
                tristate: true,
                value: checkBoxValue1,
                onChanged: (val) {
                  setState(() {
                    checkBoxValue1 = val;
                  });
                },
              ),
              const Icon(Icons.pets_outlined),

              const Text("Pets allowed"),
              // checkbox 2
              Checkbox(
                tristate: true,
                value: checkBoxValue2,
                onChanged: (val) {
                  setState(() {
                    checkBoxValue2 = val;
                  });
                },
              ),
              const Icon(Icons.wifi),

              const Text("Wifi")
            ],
          ),
          // second row checkbox options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // checkbox1
              Checkbox(
                tristate: true,
                value: checkBoxValue3,
                onChanged: (val) {
                  setState(() {
                    checkBoxValue3 = val;
                  });
                },
              ),
              const Icon(Icons.camera_indoor_outlined),

              const Text("CCTV Surveillance"),
              // checkbox 2
              Checkbox(
                tristate: true,
                value: checkBoxValue4,
                onChanged: (val) {
                  setState(() {
                    checkBoxValue4 = val;
                  });
                },
              ),
              const Icon(Icons.balcony),

              const Text("Balcony")
            ],
          ),

          // Third row checkbox Options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // checkbox1
              Checkbox(
                tristate: true,
                value: checkBoxValue5,
                onChanged: (val) {
                  setState(() {
                    checkBoxValue5 = val;
                  });
                },
              ),
              const Icon(Icons.chair_rounded),

              const Text("Fully furnitured "),
              // checkbox 2
              Checkbox(
                tristate: true,
                value: checkBoxValue6,
                onChanged: (val) {
                  setState(() {
                    checkBoxValue6 = val;
                  });
                },
              ),
              const Icon(Icons.hot_tub),

              const Text("Hot shower")
            ],
          )
        ],
      ),
    );
  }

  // Image previewer container
  Widget imagePreviewer() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
        ),
        height: 150,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: imageFileList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Image.file(
                      File(imageFileList[index].path),
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Photo widget container
  Widget photoContainer() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            selectImages();
          }, // _pickImage(ImageSource.gallery),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                ),
              ),
              Column(
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 209, 204, 204),
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Add Photos',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              //imagePreviewer(FileImage(_image!)),
              const SizedBox(width: 10.0),
              // imagePreviewer(),
              const SizedBox(width: 10.0),
              //imagePreviewer(),
            ],
          ),
        ),
        const Text(
          'Preview Images',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  // submit and cancel buttons
  Widget submitButtons() {
    return Column(
      children: [
        Row(
          children: [
            Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  )),
            )),
            const SizedBox(width: 10.0),
            ElevatedButton(
              onPressed: () async {
                setState(() => showSpinner = true);

                for (int i = 0; i < imageFileList.length; i++) {
                  String url = await uploadFile(imageFileList[i]);
                  downloadUrls.add(url);

                  if (i == imageFileList.length - 1) {
                    storeEntry(downloadUrls);
                  }
                }
                await locator.get<CloudRepository>().registerListing(
                      facilityName: nameController.text,
                      rentPrice: int.parse(rentController.text),
                      facilityCategory: selectedValue ?? '',
                      roomType: selectedValue1,
                      location: 'location',
                      photoUrl: '',
                      description: descriptionController.text,
                    );
                setState(() => showSpinner = false);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(4, 36, 47, 100)),
              child: const Text('Submit'),
            ),
          ],
        ),
        SizedBox(height: 8)
      ],
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
                  commonFacilities(),
                  photoContainer(),
                  imagePreviewer(),
                  submitButtons(),
                ],
              )),
        ),
      ),
    );
  }
}
