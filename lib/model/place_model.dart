class PlaceModel {
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

  PlaceModel({
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

  PlaceModel.fromFireStore(Map data)
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
