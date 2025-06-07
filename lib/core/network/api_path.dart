class ApiPath {
  ApiPath._();
  static const String baseUrl = "https://dummyjson.com/";
  static String users(int offset) => "users?limit=10&skip=$offset";
  static String search(String query) => "users/search?q=$query";
}