class QRCode {
  final String code;
  final String status;
  final String partyId;

  QRCode({
    required this.code,
    required this.status,
    required this.partyId,
  });

  // Factory method to create a QRCode object from JSON
  factory QRCode.fromJson(Map<String, dynamic> json) {
    return QRCode(
      code: json['code'],
      status: json['status'],
      partyId: json['party_id'],
    );
  }

  // Method to convert QRCode object to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'status': status,
      'party_id': partyId,
    };
  }
}
