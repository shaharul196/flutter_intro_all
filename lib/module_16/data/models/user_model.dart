class UserModel{
  late String id;
  late String email;
  late String firstName;
  late String lastName;
  late String mobile;
   String? photo;

  String get fullName{
    return '$firstName $lastName';
}

  // TODO json to dart
  UserModel.fromJson(Map<String, dynamic> jsonData){
    id = jsonData['_id'];
    email = jsonData['email'];
    firstName = jsonData['firstName'];
    lastName = jsonData['lastName'];
    mobile = jsonData['mobile'];
    photo = jsonData['photo'];
  }

  // TODO dart to json
  Map<String, dynamic> toJson(){
    return {
      '_id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
      'photo':photo,
    };
  }

}