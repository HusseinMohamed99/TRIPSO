class PlaceModel {
  String name;
  String image;
  String history;
  String location;
  String hours;
  String tickets;
  String pId;

  PlaceModel({
    required this.name,
    required this.history,
    required this.hours,
    required this.image,
    required this.location,
    required this.tickets,
    required this.pId,
  });

  PlaceModel.fromFireStore(Map<String, dynamic> data)
      : this(
          name: data['name'],
          image: data['image'],
          history: data['history'],
          location: data['location'],
          hours: data['hours'],
          tickets: data['tickets'],
          pId: data['pId'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'image': image,
      'history': history,
      'location': location,
      'tickets': tickets,
      'hours': hours,
      'pId': pId,
    };
  }
}