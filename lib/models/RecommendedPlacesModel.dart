// ignore: file_names
class RecommendedPlaceModel {
  final String image;
  final String rating;
  final String location;
  final String text;
  RecommendedPlaceModel(
      {required this.image,
      required this.rating,
      required this.location,
      required this.text});
}

List<RecommendedPlaceModel> recommended = [
  RecommendedPlaceModel(
      image: "assets/places/tajmahal.jpg",
      rating: "4.9",
      location: "Agra India",
      text: "Taj Mahal"),
  RecommendedPlaceModel(
      image: "assets/places/SwarnMandir.png",
      rating: "4.6",
      location: "Amritsar India",
      text: "Swarna Mandir"),
  RecommendedPlaceModel(
      image: "assets/places/statueOfUnity.png",
      rating: "4.7",
      location: "Near Kevadia India",
      text: "Statue Of Unity"),
  RecommendedPlaceModel(
      image: "assets/places/Redfort.png",
      rating: "4.6",
      location: "New Delhi India",
      text: "Red Fort"),
  RecommendedPlaceModel(
      image: "assets/places/kutubminar.png",
      rating: "4.4",
      location: "New Delhi India",
      text: "Kutub Minar"),
  RecommendedPlaceModel(
      image: "assets/places/kashmir.png",
      rating: "4.9",
      location: "Kashmir India",
      text: "Kashmir"),
];
