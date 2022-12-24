
class PlaceModel {
  String? name;
  String? image;
  String? history;
  String? location;
  String? hours;
  String? tickets;

  PlaceModel({
    this.name,
    this.history,
    this.hours,
    this.image,
    this.location,
    this.tickets,

  });

  PlaceModel.fromFireStore(Map<String, dynamic> data)
      : this(
    name: data['name'],
    image: data['image'],
    history: data['history'],
    location: data['location'],
    hours: data['hours'],
    tickets: data['tickets'],

  );

  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'image': image,
      'history': history,
      'location': location,
      'tickets': tickets,
      'hours': hours,


    };
  }
}
