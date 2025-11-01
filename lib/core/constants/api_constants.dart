class ApiConstants {
  ApiConstants._();

  static const Map<String, String> headerType = {
    'Content-Type': 'application/json',
  };
  static const String baseUrl =
      'http://10.0.2.2:8080/api/v1'; // for Android emulator
  // For iOS simulator, use http://localhost:8080/api/v1
  static const String loginUrl = "$baseUrl/auth/login";
  static const String registerUrl = "$baseUrl/auth/register";
}
