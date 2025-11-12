class ReviewModel {
  final String id;
  final String product;
  final UserInfo user;
  final double? rating;
  final String comment;

  ReviewModel({
    required this.id,
    required this.product,
    required this.user,
    required this.rating,
    required this.comment,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewModel(
      id: jsonData['_id'],
      product: jsonData['product']['_id'],
      user: UserInfo.fromJson(jsonData['user']),
      rating: 4,
      comment: jsonData['comment'],
    );
  }
}

class UserInfo {
  final String id;
  final String firstName;
  final String lastName;
  final String? avatarUrl;

  UserInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.avatarUrl,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['_id'],
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      avatarUrl: json['avatar_url'],
    );
  }
}
