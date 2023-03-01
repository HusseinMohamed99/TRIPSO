class CityModel {
  String cId;
  String image;
  String name;
  String history;
  String country;
  bool isPopular;

  CityModel({
    required this.name,
    required this.cId,
    required this.image,
    required this.history,
    required this.country,
    required this.isPopular,
  });

  CityModel.fromFireStore(Map<String, dynamic> data)
      : this(
    name: data['name'],
          image: data['image'],
          cId: data['cId'],
          history: data['history'],
          country: data['country'],
          isPopular: data['isPopular'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'image': image,
      'cId': cId,
      'history': history,
      'country': country,
      'isPopular': isPopular,
    };
  }
}