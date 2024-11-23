class NotificationModel {
  final String title;
  final String body;
  final DateTime receivedAt;

  NotificationModel({
    required this.title,
    required this.body,
    required this.receivedAt,
  });

  // Factory method to create a Notification object from JSON
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      body: json['body'],
      receivedAt: DateTime.parse(json['received_at']),
    );
  }

  // Method to convert Notification object to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'received_at': receivedAt.toIso8601String(),
    };
  }
}
