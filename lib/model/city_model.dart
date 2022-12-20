
class CityModel {
  //String? history;
  String? cId;
  String image;
  String name;

  CityModel({
    required this.name,
    this.cId,
    required this.image,
  });

  CityModel.fromFireStore(Map<String, dynamic> data)
      : this(
    name: data['name'],
          image: data['image'],
          cId: data['cId'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'image': image,
      'cId': cId,
    };
  }
  }
