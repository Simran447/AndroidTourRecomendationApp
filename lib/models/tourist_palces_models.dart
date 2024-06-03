class TouristPlacesModels {
  final String name;
  final String image;

  TouristPlacesModels({
    required this.name,
    required this.image,
  });
}

List<TouristPlacesModels> touristPlaces = [
  TouristPlacesModels(name: "Beach", image: "assets/places/beech.jpg"),
  TouristPlacesModels(name: "City", image: "assets/places/city.jpg"),
  TouristPlacesModels(name: "Desert", image: "assets/places/desert.jpg"),
  TouristPlacesModels(name: "Mountains", image: "assets/places/mountains.jpg"),
  TouristPlacesModels(name: "Forest", image: "assets/places/forest.jpg"),
];
