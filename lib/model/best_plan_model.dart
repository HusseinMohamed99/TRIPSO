class BestPLanModel {
  String city;
  String country;

  // String image;
  String name;
  String pId;
  List<String>? days;

  BestPLanModel({
    required this.city,
    required this.country,
    // required this.image,
    required this.name,
    required this.pId,
    required this.days,
  });

  BestPLanModel.fromFireStore(Map<String, dynamic> data)
      : this(
          city: data['city'],
          country: data['country'],
          name: data['name'],
          // image: data['image'],
          pId: data['pId'],
          // days: List.from(
          //   data['days'],
          // ),
          days: data['days'] is Iterable ? List.from(data['days']) : null,
        );

  Map<String, dynamic> toFireStore() {
    return {
      'city': city,
      'country': country,
      'name': name,
      //'image': image,
      'pId': pId,
      'days': days,
    };
  }
}

class Best {
  String name;
  String image;
  String history;
  String location;
  List<String> timeOfDay;
  String tickets;
  String pId;
  String address;
  String rate;
  bool isPopular;

  Best({
    required this.name,
    required this.history,
    required this.timeOfDay,
    required this.image,
    required this.location,
    required this.tickets,
    required this.pId,
    required this.isPopular,
    required this.address,
    required this.rate,
  });

  Best.fromFireStore(Map data)
      : name = data['name'],
        image = data['image'],
        history = data['history'],
        location = data['location'],
        timeOfDay = List.from(
          data['timeOfDay'],
        ),
        tickets = data['tickets'],
        pId = data['pId'],
        isPopular = data['isPopular'],
        address = data['address'],
        rate = data['rate'];

  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'image': image,
      'history': history,
      'location': location,
      'tickets': tickets,
      'timeOfDay': timeOfDay,
      'pId': pId,
      'isPopular': isPopular,
      'address': address,
      'rate': rate,
    };
  }
}
