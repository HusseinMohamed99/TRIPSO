class CityModel {
  String cId;
  String image;
  String name;
  String history;
  String country;

  CityModel({
    required this.name,
    required this.cId,
    required this.image,
    required this.history,
    required this.country,
  });

  CityModel.fromFireStore(Map<String, dynamic> data)
      : this(
    name: data['name'],
          image: data['image'],
          cId: data['cId'],
          history: data['history'],
          country: data['country'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'image': image,
      'cId': cId,
      'history': history,
      'country': country,
    };
  }
}
