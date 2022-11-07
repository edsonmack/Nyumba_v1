import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:nyumba/Models/listing_model.dart';

class CloudRepository {
  CloudRepository(
      {required FirebaseAuth firebaseAuth,
      required FirebaseFirestore firebaseFirestore})
      : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  static const String listingPath = 'listing';

  Stream<User?> get userStream => _firebaseAuth.authStateChanges();

  //map listing to firestore

  Future<ListingModel?> registerListing({
    required String facilityName,
    required int rentPrice,
    required String facilityCategory,
    required String roomType,
    required String location,
    required String photoUrl,
    required String description,
  }) async {
    try {
      final uid = _firebaseAuth.currentUser!.uid;
      final id = _firebaseFirestore.collection(listingPath).doc().id;

      final listingDetails = ListingModel(
        id: id,
        uid: uid,
        dateTime: DateTime.now(),
        facilityName: facilityName,
        rentPrice: rentPrice,
        facilityCategory: facilityCategory,
        roomType: roomType,
        location: location,
        photoUrl: photoUrl,
        description: description,
      );

      await _firebaseFirestore
          .collection(listingPath)
          .doc(id)
          .set(listingDetails.toMap());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  //retrieve data from firestore
  Stream<List<ListingModel>> getListing() {
    final uid = _firebaseAuth.currentUser?.uid;
    final data = _firebaseFirestore
        .collection(listingPath)
        .where('uid', isEqualTo: uid)
        .orderBy('dateTime', descending: true)
        .snapshots();

    return data.map((query) {
      return query.docs.map((e) {
        return ListingModel.fromMap(e.data());
      }).toList();
    });
  }

  //delete data from firestore
  Future<void> deleteListing(String id) async {
    await _firebaseFirestore.collection(listingPath).doc(id).delete();
  }

  //update data from firestore
  Future<void> updateListing(String id, String location) async {
    await _firebaseFirestore
        .collection(listingPath)
        .doc(id)
        .update({'location': location});
  }
}
