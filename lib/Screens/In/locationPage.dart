import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

const KGoogleApiKey = 'AIzaSyAi7jTovhMigqNBZP5Sw_ay744Ev7QeraQ';

final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _LocationPageState extends State<LocationPage> {
  // Camera position Initialization
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(37.42796, 122.08574), zoom: 14.0);

  late Completer<GoogleMapController> _controller = Completer();
  final Mode _mode = Mode.overlay;

  Set<Marker> markerList = {};
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
          ElevatedButton(
              onPressed: handlePressButton, child: const Text('Search Places'))
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
                borderSide: BorderSide(color: Colors.white))),
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

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    markerList.clear();
    markerList.add(Marker(
        markerId: const MarkerId("0"),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: detail.result.name)));

    setState(() {});
    final GoogleMapController googleMapController = await _controller.future;
    googleMapController
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
  }
}
