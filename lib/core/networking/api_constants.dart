class ApiConstants {
  static const String baseUrl =
      "http://natours-env.eba-5u5qsine.us-east-1.elasticbeanstalk.com";
  static const String apiUrl = "$baseUrl/api/v1/";
  static const String login = "users/login";
  static const String signup = "users/signup";
  static const String getMe = "users/me";
  static const String getAllTours = "tours";
  static const String payment = "booking/payment-intent";
  static const String baseToursImageUrl = "$baseUrl/img/tours/";
  static const String baseUsersImageUrl = "$baseUrl/img/users/";
  static const String invalidTokenMessage =
      "Session expired. Please log in again.";
}
