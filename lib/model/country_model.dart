class CountryModel {
  String counId;
  String image;
  String name;

  CountryModel({
    required this.name,
    required this.counId,
    required this.image,
  });

  CountryModel.fromFireStore(Map<String, dynamic> data)
      : this(
          name: data['name'],
          image: data['image'],
          counId: data['counId'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'image': image,
      'counId': counId,
    };
  }
}
