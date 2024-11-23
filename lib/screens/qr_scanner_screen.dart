import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../services/qr_service.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isProcessing = false;
  final QRService qrService = QRService();

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController qrController) {
    this.controller = qrController;
    controller!.scannedDataStream.listen((scanData) async {
      if (!isProcessing) {
        setState(() {
          isProcessing = true;
        });

        await _validateQRCode(scanData.code);

        setState(() {
          isProcessing = false;
        });
      }
    });
  }

  Future<void> _validateQRCode(String? code) async {
    if (code == null) return;

    final token =
        Provider.of<AuthProvider>(context, listen: false).user?['token'];
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unauthorized: Please login first.')),
      );
      return;
    }

    try {
      final response = await qrService.validateQRCode(code, token);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('QR Code Status: ${response['status']}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Validation failed: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Scanner')),
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          if (isProcessing)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
