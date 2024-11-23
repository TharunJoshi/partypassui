import 'package:flutter_test/flutter_test.dart';
import 'package:partypassui/services/auth_service.dart';

void main() {
  final AuthService authService = AuthService();

  group('AuthService Tests', () {
    test('Login should return a valid response', () async {
      final response =
          await authService.login('testuser@example.com', 'password123');
      expect(response['token'], isNotNull);
    });

    test('Signup should return a valid response', () async {
      final response =
          await authService.signup('newuser@example.com', 'password123');
      expect(response['message'], equals('Signup successful'));
    });
  });
}
