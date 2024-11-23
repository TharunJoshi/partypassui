class Constants {
  static const String baseUrl = 'http://127.0.0.1:5000'; // Backend server URL
  static const String loginEndpoint = '$baseUrl/auth/login';
  static const String signupEndpoint = '$baseUrl/auth/signup';
  static const String dashboardEndpoint = '$baseUrl/auth/dashboard';
  static const String qrValidationEndpoint = '$baseUrl/qr/validate';
  static const String subscriptionEndpoint = '$baseUrl/subscription/details';
}
