import 'package:cloud_firestore/cloud_firestore.dart';

class WishListModel {
  String? uId;
  String? name;
  String? profilePicture;
  FieldValue? dateTime;

  WishListModel({
    this.uId,
    this.name,
    this.profilePicture,
    this.dateTime,
  });

  WishListModel.fromJson(Map<String, dynamic>? json) {
    uId = json!['uId'];
    name = json['name'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'name': name,
      'profilePicture': profilePicture,
      'dateTime': dateTime,
    };
  }
}
