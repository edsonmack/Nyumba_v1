import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

const KGoogleApiKey = 'AIzaSyDye80CnIi3pNtYYBaqm82ybEfuoJ8uDtc';

final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _LocationPageState extends State<LocationPage> {
  // Camera position Initialization
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(-1.181056, 36.927234), zoom: 14.0);

  late Completer<GoogleMapController> _controller = Completer();
  final Mode _mode = Mode.overlay;
  late final String _locationName;

  String get locationName => _locationName;
  Set<Marker> markerList = {};

  String? loc;

  // location variables
  var lat1;
  var lng1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      appBar: AppBar(title: const Text("Google Search Places")),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            initialCameraPosition: initialCameraPosition,
            markers: markerList,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: handlePressButton,
                  child: const Text('Search Places')),
              ElevatedButton(
                  onPressed: () {
                    // latitude result saved as 'lat1', longitude result saved as 'lng1'
                    // serach resilt saved as 'details'
                    FirebaseFirestore.instance.collection('Listings').add({
                      'name': loc,
                    });
                  },
                  child: const Text("Save Location"))
            ],
          ),
        ],
      ),
    );
  }

  Future<void> handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: KGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [""],
        decoration: InputDecoration(
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white))),
        components: [Component(Component.country, "KE")]);

    displayPredicition(p!, homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  Future<void> displayPredicition(
      Prediction p, ScaffoldState? currentState) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: KGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    final lat1 = detail.result.geometry!.location.lat;
    final lng1 = detail.result.geometry!.location.lng;
    _locationName = detail.result.name;

    markerList.clear();
    markerList.add(Marker(
        markerId: const MarkerId("0"),
        position: LatLng(lat1, lng1),
        infoWindow: InfoWindow(title: locationName
            // detail.result.name
            )));
    String Loc = locationName;

    setState(() {});
    final GoogleMapController googleMapController = await _controller.future;
    googleMapController
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat1, lng1), 14.0));

    // print(InfoWindow(title: ));
  }
}

// String locationName = InfoWindow (title)
