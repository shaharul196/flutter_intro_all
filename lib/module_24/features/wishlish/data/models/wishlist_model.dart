class WishListModel {
  final String id;
  final String title;
  final List<String> photos;
  final int currentPrice;
  final double rating;

  WishListModel({
    required this.id,
    required this.title,
    required this.photos,
    required this.currentPrice,
    required this.rating,
  });

  factory WishListModel.fromJson(Map<String, dynamic> jsonData) {
    return WishListModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      photos: List<String>.from(jsonData['photos'].map((e) => e).toList()),
      currentPrice: jsonData['current_price'],
      rating: 5.2,
    );
  }
}
