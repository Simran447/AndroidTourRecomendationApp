class NearByPlacesModel {
  final String image;
  final String name;
  final String location;
  final String firstPlace;
  final String secondPlace;
  final String Rating;
  final String price;
  NearByPlacesModel(
      {required this.image,
      required this.name,
      required this.location,
      required this.firstPlace,
      required this.secondPlace,
      required this.Rating,
      required this.price});
}

List<NearByPlacesModel> nearPlaces = [
  NearByPlacesModel(
      image: "assets/places/kashmir.png",
      name: "Kashmir",
      location: "Jammu & Kashmir",
      firstPlace: "Your Location",
      secondPlace: "this Place",
      Rating: "4.9",
      price: "\$39"),
  NearByPlacesModel(
      image: "assets/places/kutubminar.png",
      name: "Kutub Minar",
      location: "New Delhi",
      firstPlace: "Your Location",
      secondPlace: "this Place",
      Rating: "4.4",
      price: "\$32"),
  NearByPlacesModel(
      image: "assets/places/Redfort.png",
      name: "Red Fort",
      location: "New Delhi India",
      firstPlace: "Your Location",
      secondPlace: "this Place",
      Rating: "4.6",
      price: "\$32"),
  NearByPlacesModel(
      image: "assets/places/statueOfUnity.png",
      name: "Statue Of Unity",
      location: "Near Kevadia India",
      firstPlace: "Your Location",
      secondPlace: "this Place",
      Rating: "4.7",
      price: "\$39"),
  NearByPlacesModel(
      image: "assets/places/SwarnMandir.png",
      name: "Swarna Mandir",
      location: "Amritsar India",
      firstPlace: "Your Location",
      secondPlace: "this Place",
      Rating: "4.6",
      price: "\$25"),
  NearByPlacesModel(
      image: "assets/places/tajmahal.jpg",
      name: "Taj Mahal",
      location: "Agra India",
      firstPlace: "Your Location",
      secondPlace: "this Place",
      Rating: "4.9",
      price: "\$30"),
];
