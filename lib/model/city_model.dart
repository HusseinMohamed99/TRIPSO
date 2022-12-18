
class CityModel {
  //String? history;
  String? image;
  String? name;

  CityModel(
      {
        this.name,
        this.image,
      });

  CityModel.fromFireStore(Map<String, dynamic> data)
      : this(
    name: data['name'],
    image: data['image'],
  );

  Map<String, dynamic> toFireStore() {
    return {
      'name' : name,
      'image': image,
    };
  }
  }
