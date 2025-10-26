class Urls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static const String loginUrl = '$_baseUrl/auth/login';
  static const String homeSlidersUrl = '$_baseUrl/slides';

  static String categoryListUrl(int pageNo, int pageSize) =>
      '$_baseUrl/categories?count=$pageSize&page=$pageNo';

  static String productListUrl(int pageNo, int pageSize, String categoryId) =>
      '$_baseUrl/products?count=$pageSize&page=$pageNo&category=$categoryId';

  static String productDetailsUrl(String productId) =>
      '$_baseUrl/products/id/$productId';

  static const String addToCartUrl = '$_baseUrl/cart';
  static const String cartListUrl = '$_baseUrl/cart';
  static const String wishListUrl = '$_baseUrl/wishlist';
  static const String addReviewUrl = '$_baseUrl/review';

  static String reviewUrl(String productId) =>
      '$_baseUrl/reviews$productId';
}
