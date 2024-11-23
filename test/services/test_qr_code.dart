import 'package:flutter_test/flutter_test.dart';
import 'package:partypassui/services/qr_service.dart';

void main() {
  final QRService qrService = QRService();

  group('QRService Tests', () {
    test('QR code validation should return valid response', () async {
      final token = 'sample_token';
      final response = await qrService.validateQRCode('sample_code', token);
      expect(response['status'], equals('Valid'));
    });
  });
}
