class PlanModel {
  String uId;
  String planCityID;
  String planName;
  String planImage;
  String planHistory;
  String planLocation;
  List<String> planTimeOfDay;
  String planTickets;
  String planId;
  String planAddress;
  String planRate;
  bool planIsPopular;
  bool planAdded;
  int indexOfDays;
  DateTime dateTime;

  PlanModel({
    required this.uId,
    required this.planCityID,
    required this.planName,
    required this.planHistory,
    required this.planTimeOfDay,
    required this.planImage,
    required this.planLocation,
    required this.planTickets,
    required this.planId,
    required this.planIsPopular,
    required this.planAddress,
    required this.planRate,
    required this.indexOfDays,
    required this.dateTime,
    this.planAdded = true,
  });

  PlanModel.fromFireStore(Map<String, dynamic> data)
      : this(
          uId: data['uId'],
          planCityID: data['planCityID'],
          planName: data['planName'],
          planImage: data['planImage'],
          planHistory: data['planHistory'],
          planLocation: data['planLocation'],
          planTimeOfDay: List.from(data['planTimeOfDay']),
          planTickets: data['planTickets'],
          planId: data['planId'],
          planIsPopular: data['planIsPopular'],
          planAddress: data['planAddress'],
          planRate: data['planRate'],
          planAdded: data['planAdded'],
          indexOfDays: data['indexOfDays'],
          dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
        );

  Map<String, dynamic> toFireStore() {
    return {
      'uId': uId,
      'planCityID': planCityID,
      'planName': planName,
      'planImage': planImage,
      'planHistory': planHistory,
      'planLocation': planLocation,
      'planTickets': planTickets,
      'planTimeOfDay': planTimeOfDay,
      'planId': planId,
      'planIsPopular': planIsPopular,
      'planAddress': planAddress,
      'planRate': planRate,
      'planAdded': planAdded,
      'indexOfDays': indexOfDays,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }
}
