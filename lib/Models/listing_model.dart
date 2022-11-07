// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ListingModel {
  final String id;
  final String uid;
  final DateTime dateTime;
  String facilityName;
  int rentPrice;
  String facilityCategory;
  String roomType;
  String location;
  String? description;
  List<String>? placOffers;
  String photoUrl;
  
  ListingModel({
    required this.id,
    required this.uid,
    required this.dateTime,
    required this.facilityName,
    required this.rentPrice,
    required this.facilityCategory,
    required this.roomType,
    required this.location,
    this.description,
    this.placOffers,
    required this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uid': uid,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'facilityName': facilityName,
      'rentPrice': rentPrice,
      'facilityCategory': facilityCategory,
      'roomType': roomType,
      'location': location,
      'description': description,
      'placOffers': placOffers,
      'photoUrl': photoUrl,
    };
  }

  factory ListingModel.fromMap(Map<String, dynamic> map) {
    return ListingModel(
      id: map['id'] as String,
      uid: map['uid'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      facilityName: map['facilityName'] as String,
      rentPrice: map['rentPrice'] as int,
      facilityCategory: map['facilityCategory'] as String,
      roomType: map['roomType'] as String,
      location: map['location'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      placOffers: map['placOffers'] != null
          ? List<String>.from((map['placOffers'] as List<String>))
          : null,
      photoUrl: map['photoUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListingModel.fromJson(String source) =>
      ListingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
