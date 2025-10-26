class AddReviewModel {
  final String productId;
  final String comment;
  final double rating;

  AddReviewModel({
    required this.productId,
    required this.comment,
    required this.rating,
  });

  factory AddReviewModel.fromJson(Map<String, dynamic> jsonData) {
    return AddReviewModel(
      productId: jsonData['product'],
      comment: jsonData['comment'],
      rating: jsonData['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"product": productId, "comment": comment, "rating": rating};
  }
}
