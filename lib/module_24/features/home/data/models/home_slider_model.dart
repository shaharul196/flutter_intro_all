class HomeSliderModel {
  final String id;
  final String photoUrl;
  final String description;
  final String brandId;

  HomeSliderModel({
    required this.id,
    required this.photoUrl,
    required this.description,
    required this.brandId,
  });

  factory HomeSliderModel.fromJson(Map<String, dynamic> jsonData) {
    return HomeSliderModel(
        id: jsonData['_id'],
        photoUrl: jsonData['photo_url'],
        description:jsonData['description'],
        brandId: jsonData['brand'],
    );
  }

}

// {
// "_id": "680d1632408c2a3e015a83aa",
// "photo_url": "https://cdn.dribbble.com/userupload/14251223/file/original-ccf454426d2b7842dfdcd6917528301d.jpg?resize=2048x1152&vertical=center",
// "description": "Solid T shirt",
// "product": null,
// "brand": "679a05182b11cd5ff18023e9",
// "category": null,
// "createdAt": "2025-04-26T17:21:54.663Z",
// "updatedAt": "2025-04-26T17:21:54.663Z",
// "__v": 0
// },
