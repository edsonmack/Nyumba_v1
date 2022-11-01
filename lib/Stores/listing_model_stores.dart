// import "package:mobx/mobx.dart";

// // part 'listing_store.g.dart';

// class ListingStore = ListingBase with _$Listing;

// abstract class ListingBase with Store {
//   @observable
//   String facilityName = "";

//   @observable
//   int rentPrice = 0;

//   @observable
//   String facilityCategory = "";

//   @observable
//   String roomType = "";

//   @observable
//   String location = "";

//   @observable
//   String? description;

//   @observable
//   ObservableList<String> placeOffers = ObservableList.of([]);

//   @observable
//   String? photoUrl;

//   @action
//   void addPlaceOffers(String value) {
//     placeOffers.add(value);
//   }

//   @action
//   void changeFacilityName(String value) {
//     facilityName = value;
//   }

//   @action
//   void changeRentPrice(int value) {
//     rentPrice = value;
//   }

//   @action
//   void changeFacilityCategory(String value) {
//     facilityCategory = value;
//   }

//   @action
//   void changeRoomType(String value) {
//     roomType = value;
//   }

//   @action
//   void changeLocation(String value) {
//     location = value;
//   }

//   @action
//   void changeDescription(String value) {
//     description = value;
//   }

//   @action
//   void changePhotoUrl(String value) {
//     photoUrl = value;
//   }
// }
