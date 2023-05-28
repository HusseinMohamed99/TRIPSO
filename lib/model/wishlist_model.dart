class WishListModel {
  String uId;
  String wishListCityID;
  String wishListName;
  String wishListImage;
  String wishListHistory;
  String wishListLocation;
  List<String> wishListTimeOfDay;
  String wishListTickets;
  String wishListId;
  String wishListAddress;
  String wishListRate;
  bool wishListIsPopular;
  bool isWishList;

  WishListModel({
    required this.uId,
    required this.wishListCityID,
    required this.wishListName,
    required this.wishListHistory,
    required this.wishListTimeOfDay,
    required this.wishListImage,
    required this.wishListLocation,
    required this.wishListTickets,
    required this.wishListId,
    required this.wishListIsPopular,
    required this.wishListAddress,
    required this.wishListRate,
    this.isWishList = true,
  });

  WishListModel.fromFireStore(Map data)
      : this(
          uId: data['uId'],
          wishListCityID: data['wishListCityID'],
          wishListName: data['wishListName'],
          wishListImage: data['wishListImage'],
          wishListHistory: data['wishListHistory'],
          wishListLocation: data['wishListLocation'],
          wishListTimeOfDay: List.from(
            data['wishListTimeOfDay'],
          ),
          wishListTickets: data['wishListTickets'],
          wishListId: data['wishListId'],
          wishListIsPopular: data['wishListIsPopular'],
          wishListAddress: data['wishListAddress'],
          wishListRate: data['wishListRate'],
          isWishList: data['isWishList'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'uId': uId,
      'wishListCityID': wishListCityID,
      'wishListName': wishListName,
      'wishListImage': wishListImage,
      'wishListHistory': wishListHistory,
      'wishListLocation': wishListLocation,
      'wishListTickets': wishListTickets,
      'wishListTimeOfDay': wishListTimeOfDay,
      'wishListId': wishListId,
      'wishListIsPopular': wishListIsPopular,
      'wishListAddress': wishListAddress,
      'wishListRate': wishListRate,
      'isWishList': isWishList,
    };
  }
}
