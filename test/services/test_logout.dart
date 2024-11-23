import 'package:flutter_test/flutter_test.dart';
import 'package:partypassui/utils/session_manager.dart';

void main() {
  group('Logout Functionality', () {
    test('Logout should clear the token', () async {
      await SessionManager.saveToken('sample_token');
      await SessionManager.clearToken();
      final token = await SessionManager.getToken();
      expect(token, isNull);
    });
  });
}
