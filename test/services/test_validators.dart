import 'package:flutter_test/flutter_test.dart';
import 'package:partypassui/utils/validators.dart';

void main() {
  group('Validators Tests', () {
    test('Validate correct email format', () {
      final result = Validators.validateEmail('test@example.com');
      expect(result, isNull); // Valid email returns null
    });

    test('Validate incorrect email format', () {
      final result = Validators.validateEmail('invalid-email');
      expect(result, equals('Enter a valid email'));
    });
  });
}
