import 'dart:convert';
import 'package:http/http.dart' as http;

class QRService {
  final String baseUrl =
      'http://127.0.0.1:5000/qr'; // Replace with your backend URL

  // Validate QR Code
  Future<Map<String, dynamic>> validateQRCode(String code, String token) async {
    final url = Uri.parse('$baseUrl/validate');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'code': code}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to validate QR code: ${response.body}');
    }
  }
}
