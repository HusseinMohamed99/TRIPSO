class UserModel {
  String email;
  String firstName;
  String lastName;
  String uId;
  String image;

  UserModel({
    this.uId = '',
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
  });

  UserModel.fromFireStore(Map<String, dynamic> data)
      : this(
          uId: data['uId'],
          email: data['email'],
          firstName: data['firstName'],
          lastName: data['lastName'],
          image: data['image'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'uId': uId,
      'image': image,
    };
  }
}
