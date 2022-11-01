class ListingModel {
  String facilityName;
  int rentPrice;
  String facilityCategory;
  String roomType;
  String location;
  String? description;
  List<String>? placOffers;
  String photoUrl;

  ListingModel({
    required this.facilityName,
    required this.rentPrice,
    required this.facilityCategory,
    required this.roomType,
    required this.location,
    this.description,
    this.placOffers,
    required this.photoUrl,
  });
}
