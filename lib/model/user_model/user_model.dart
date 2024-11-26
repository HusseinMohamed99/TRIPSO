import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String uId;
  final String image;
  final String? address;

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.uId,
    required this.image,
    this.address,
  });

  /// Factory constructor for creating a new `UserModel` instance from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Method to convert a `UserModel` instance to JSON
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
